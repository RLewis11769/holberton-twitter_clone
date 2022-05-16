import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart';

enum Errors {
  none,
  matchError,
  weakError,
  existsError,
  wrongError,
  noUserError,
  error,
}

class Auth extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // FirebaseAuth get auth => _auth;

  final usersRef =
      FirebaseFirestore.instance.collection('users').withConverter<CustomUser>(
            fromFirestore: (snapshot, _) {
              return CustomUser.fromJson(
                snapshot.data() ?? {},
              );
            },
            toFirestore: (user, _) => user.toJson(),
          );

  handleException(e) {
    // This should be Error type but can't get it working so casting all Errors to string
    String _status;
    switch (e.code) {
      case "weak-password":
        _status = Errors.weakError.toString();
        break;
      case "email-already-in-use":
        _status = Errors.existsError.toString();
        break;
      case "user-not-found":
        _status = Errors.noUserError.toString();
        break;
      case "wrong-password":
        _status = Errors.wrongError.toString();
        break;
      default:
        _status = Errors.error.toString();
        break;
    }
    return _status;
  }

  Future<String> attemptSignUp(String name, String email, String password,
      String passwordConfirmation) async {
    // Here is where Error _status does not work so require casting Errors to string
    String _status = '';
    // Manual check to make sure passwords match
    if (password != passwordConfirmation) {
      return Errors.matchError.toString();
    }
    try {
      // This adds user to Firebase Authentication
      UserCredential userCredentials =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? signedInUser = userCredentials.user;
      if (signedInUser != null) {
        // Using toJson would be better but this works
        Map<String, dynamic> userMap = {
          'key': signedInUser.uid,
          'userID': signedInUser.uid,
          'email': signedInUser.email,
          'userName': name,
          'displayName': name,
          'imageUrl': '',
          'isVerified': false,
          'followers': 0,
          'following': 0,
          'followersList': [],
          'followingList': [],
        };
        // This adds user to users collection
        await usersRef.doc(signedInUser.uid).set(CustomUser.fromJson(userMap));
        notifyListeners();
        return Errors.none.toString();
      }
    } on FirebaseAuthException catch (e) {
      _status = handleException(e);
    }
    return _status;
  }

  Future<String> attemptLogin(String email, String password) async {
    String _status = '';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Errors.none.toString();
    } on FirebaseAuthException catch (e) {
      _status = (handleException(e));
    }
    return _status.toString();
  }

  void logout() {
    _auth.signOut();
    notifyListeners();
  }

  Future<CustomUser> getCurrentUserModel() async {
    final snapshot = await usersRef.doc(_auth.currentUser!.uid).get();
    final user = snapshot.data()?.toJson();
    return CustomUser.fromJson(user!);
  }
}
