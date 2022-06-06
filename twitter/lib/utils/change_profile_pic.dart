import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

Future<String> pickImageFromDevice(context, type) async {
  final scaffold = ScaffoldMessenger.of(context);
  final Storage storage = Storage();

  // Allow user to pick one image from their device of specified types
  final results = await FilePicker.platform.pickFiles(
    allowMultiple: false,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png', 'jpeg'],
  );
  String url = '';
  // If clicks out without selecting an image, show message
  if (results != null) {
    final path = results.files.single.path;
    url = await storage.uploadImageFile(context, path!, type);
    // After successful upload, show snackbar
    scaffold.showSnackBar(const SnackBar(
      content:
          Text('Image uploaded successfully!', textAlign: TextAlign.center),
      backgroundColor: Color(0xFF8eb057),
    ));
  }
  // Note that url has been set in Firebase at this point
  // If finish before returning, all will be changed on any click to different page
  // But need to make sure setState is called after returning so can re-render page and update pic
  return url;
}

class Storage {
  // Get reference to Firebase Storage
  final firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  Future<String> uploadImageFile(context, String filePath, type) async {
    final scaffold = ScaffoldMessenger.of(context);
    // Create file reference from path
    File file = File(filePath);
    // File name will be user email so user only has one profile picture
    String? email = FirebaseAuth.instance.currentUser!.email;
    try {
      // Upload file to Firebase Storage
      if (type == 'imageUrl') {
        await storage.ref('profile/$email').putFile(file);
      } else if (type == 'coverImgUrl') {
        await storage.ref('cover/$email').putFile(file);
      }
      // After successful upload, retrieve file url (return url to caller)
      return getImageUrl(type);
    } on firebase_core.FirebaseException catch (e) {
      scaffold.showSnackBar(const SnackBar(
        content: Text('Error uploading file!', textAlign: TextAlign.center),
        backgroundColor: Color(0xFFe05e4a),
      ));
      return '';
    }
  }

  Future<String> getImageUrl(type) async {
    String? email = FirebaseAuth.instance.currentUser!.email;
    String userID = FirebaseAuth.instance.currentUser!.uid;
    String url;
    // There is no hoisting in Dart, so can't use "url" outside of if statement. Hate that.
    // Get reference to image in Firebase Storage (for each user, file name is email)
    if (type == 'imageUrl') {
      url = await storage.ref('profile/$email').getDownloadURL();
      // Update user profile in Firebase Firestore
      await FirebaseFirestore.instance.collection('users').doc(userID).update({
        type: url,
      });
      // Begin to pass url back to caller
      return url;
    } else {
      url = await storage.ref('cover/$email').getDownloadURL();
      // Update user profile in Firebase Firestore
      await FirebaseFirestore.instance.collection('users').doc(userID).update({
        type: url,
      });
      // Begin to pass url back to caller
      return url;
    }
  }
}
