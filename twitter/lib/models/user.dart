class CustomUser {
  // Fields within User table
  String key;
  String userID;
  String email;
  String userName;
  String displayName;
  String imageUrl;
  bool isVerified;
  // Making optional fields for now
  int followers;
  int following;
  List<String> followersList;
  List<String> followingList;

  // Constructor
  CustomUser({
    required this.key,
    required this.userID,
    required this.email,
    required this.userName,
    required this.displayName,
    required this.imageUrl,
    required this.isVerified,
    // Can probably just find length of list rather than passing in - we'll see
    required this.followers,
    required this.following,
    required this.followersList,
    required this.followingList,
  });

  // named constructor fromJson
  factory CustomUser.fromJson(Map<dynamic, dynamic> map) => CustomUser(
        key: map['key'],
        userID: map['userID'],
        email: map['email'],
        userName: map['userName'],
        displayName: map['displayName'],
        imageUrl: map['imageUrl'],
        isVerified: map['isVerified'],
        followers: map['followers'],
        following: map['following'],
        // Probably incorrect
        followersList: List<String>.from(map['followersList']),
        followingList: List<String>.from(map['followingList']),
      );

  // instance method toJson that returns a Map<String, dynamic>
  Map<String, Object?> toJson() => {
        "key": key,
        "userID": userID,
        "email": email,
        "userName": userName,
        "displayName": displayName,
        "imageUrl": imageUrl,
        "isVerified": isVerified,
        "followers": followers,
        "following": following,
        "followersList": followersList,
        "followingList": followingList,
      };
}
