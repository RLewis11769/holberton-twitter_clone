import 'package:cloud_firestore/cloud_firestore.dart';
import '../providers/auth_state.dart';
import '../models/post.dart';
import '../models/user.dart';

final postsRef =
    FirebaseFirestore.instance.collection('posts').withConverter<Post>(
          fromFirestore: (snapshot, _) {
            return Post.fromJson(
              snapshot.data() ?? {},
            );
          },
          toFirestore: (post, _) => post.toJson(),
        );

Future<CustomUser> getUserByID(String userID) async {
  // Get the user from Firebase users collection
  final snapshot = await Auth().usersRef.doc(userID).get();
  // Convert data to JSON format
  final user = snapshot.data()!.toJson();
  // Return JSON converted to CustomUser object
  return CustomUser.fromJson(user);
}

Future<String> getUserPicByID(String userID) async {
  // Get the user from Firebase users collection
  final snapshot = await Auth().usersRef.doc(userID).get();
  // Convert data to JSON format
  final user = snapshot.data()!.toJson();
  // Return JSON converted to CustomUser object
  return CustomUser.fromJson(user).imageUrl;
}

void updateUserModel(
    String userID, String updatedField, dynamic updatedValue) async {
  // Update the user in Firestore users collection
  await Auth().usersRef.doc(userID).update({
    updatedField: updatedValue,
  });
}

void updatePostModel(
    String userID, String updatedField, dynamic updatedValue) async {
  // Update the post in Firebase posts collection
  await postsRef.doc(userID).update({
    updatedField: updatedValue,
  });
}
