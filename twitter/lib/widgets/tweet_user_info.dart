import 'package:flutter/material.dart';
import '../models/user.dart';
import '../screens/profile_screen.dart';
import '../utils/general_info.dart';

class TweetUserInfo extends StatefulWidget {
  final String userID;
  final String postText;
  const TweetUserInfo({Key? key, required this.userID, required this.postText})
      : super(key: key);

  @override
  State<TweetUserInfo> createState() => _TweetUserInfoState();
}

class _TweetUserInfoState extends State<TweetUserInfo> {
  @override
  Widget build(BuildContext context) {
    String userID = widget.userID;

    return FutureBuilder(
      // Run async code dependent on results of "future" query listed below
      future: getUserByID(userID),
      builder: (BuildContext context, AsyncSnapshot<CustomUser> snapshot) {
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          // When results returned from async code, return widget using data from results
          return Row(children: [
            GestureDetector(
              // When click on user who posted tweet, go to user's profile
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                              userID: userID,
                            )));
              },
              child: Row(
                children: [
                  Text(snapshot.data!.displayName,
                      // Ellipsis would probably be best - but fades out name instead
                      overflow: TextOverflow.fade,
                      softWrap: false,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold)),
                  if (snapshot.data!.isVerified)
                    Icon(
                      Icons.check_circle,
                      color: Theme.of(context).primaryColor,
                      size: 15,
                    ),
                ],
              ),
            ),
            // If verified, add checkmark - else do nothing
            Text('@' + snapshot.data!.userName,
                overflow: TextOverflow.fade,
                softWrap: false,
                style: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Theme.of(context).primaryColorLight)),
          ]);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
