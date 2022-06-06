import 'package:flutter/material.dart';
import '../models/user.dart';
import '../utils/general_info.dart';

class FollowButton extends StatefulWidget {
  final String userID;
  final CustomUser currentUser;
  const FollowButton(
      {Key? key, required this.userID, required this.currentUser})
      : super(key: key);

  @override
  State<FollowButton> createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  bool _isFollowing = false;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    // Check if current user is following this user
    _isCurrentlyFollowing();
    // });
  }

  void _isCurrentlyFollowing() async {
    setState(() {
      if (widget.currentUser.followingList.contains(widget.userID)) {
        _isFollowing = true;
      } else {
        _isFollowing = false;
      }
    });
  }

  void followUser() async {
    // Add user to current user's following list
    widget.currentUser.followingList.add(widget.userID);
    widget.currentUser.following += 1;
    // Update database for current user (logged in user who is viewing profile/following)
    updateUserModel(widget.currentUser.userID, 'followingList',
        widget.currentUser.followingList);
    updateUserModel(
        widget.currentUser.userID, 'following', widget.currentUser.following);

    // Add current user to user's followers list
    final thisUser = await getUserByID(widget.userID);
    thisUser.followersList.add(widget.currentUser.userID);
    thisUser.followers += 1;
    // Update database for this user
    updateUserModel(
        widget.userID, 'followersList', thisUser.followersList);
    updateUserModel(widget.userID, 'followers', thisUser.followers);

       // Update state so button changes etc.
    setState(() {
      _isFollowing = true;
     });
  }

  void unfollowUser() async {
    // Add user to current user's following list
    widget.currentUser.followingList.remove(widget.userID);
    widget.currentUser.following -= 1;
    // Update database at current user (logged in user who is viewing profile/unfollowing)
    updateUserModel(widget.currentUser.userID, 'followingList',
        widget.currentUser.followingList);
    updateUserModel(
        widget.currentUser.userID, 'following', widget.currentUser.following);

    // Remove current user to user's followers list
    final thisUser = await getUserByID(widget.userID);
    thisUser.followersList.remove(widget.currentUser.userID);
    thisUser.followers -= 1;
    // Update database at this user
    updateUserModel(
        widget.userID, 'followersList', thisUser.followersList);
    updateUserModel(widget.userID, 'followers', thisUser.followers);

       // Update state so button changes etc.
    setState(() {
      _isFollowing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 200),
      child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: OutlinedButton(
                // Outlined button in shape of circle - not doing anything yet
                style: OutlinedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  shape: const CircleBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                ),
                onPressed: () {},
                // Icon inside outlined button
                child: const Icon(Icons.mail_outline),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                // When press either follow or unfollow button, call the appropriate function
                if (_isFollowing) {
                  unfollowUser();
                } else {
                  followUser();
                }
              },
              // Outlined button with rounded corners - style of button whether follow or unfollow
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              // Text of outlined button depending on whether current user is following this user or not
              child: _isFollowing
                  ? Text('Unfollow',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white))
                  : Text('Follow',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText2!
                              .copyWith(color: Colors.white)),
            ),
          ]),
    );
  }
}
