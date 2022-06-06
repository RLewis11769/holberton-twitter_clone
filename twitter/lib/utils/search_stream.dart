import '../models/post.dart';
import '../providers/auth_state.dart';
import '../models/user.dart';
import './general_info.dart';

Stream<List<CustomUser>>? getMatchingUsers(
    String userName, CustomUser currentUser) {
  if (userName != '') {
    return Auth()
        .usersRef
        // Don't include current user in search results
        .where('userName', isNotEqualTo: currentUser.userName)
        // This allows for partial strings
        // Any string between actual userName and the username plus last character possible
        .where('userName', isGreaterThanOrEqualTo: userName)
        .where('userName', isLessThanOrEqualTo: userName + '\uf8ff')
        // Only want 10 results max
        .limit(10)
        // Get snapshot of every piece of data from Firestore that matches the query
        .snapshots()
        // For each document in snapshot, convert to CustomUser and return list
        .map((snapshot) => snapshot.docs
            .map((doc) => CustomUser.fromJson(doc.data().toJson()))
            .toList());
  } else {
    return null;
  }
}

Stream<List<Post>>? getAllPosts() {
  return postsRef
      .snapshots()
      // For each document in snapshot, convert to Post type and return list
      .map((snapshot) => snapshot.docs
          .map((doc) => Post.fromJson(doc.data().toJson()))
          .toList());
}
