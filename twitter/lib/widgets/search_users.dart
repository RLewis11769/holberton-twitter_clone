import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/user.dart';
import '../providers/app_state.dart';
import './users_search_results_widget.dart';
import '../utils/search_stream.dart';

class SearchUsers extends StatefulWidget {
  final String searchText;
  const SearchUsers({Key? key, required this.searchText}) : super(key: key);

  @override
  State<SearchUsers> createState() => _SearchUsersState();
}

class _SearchUsersState extends State<SearchUsers> {
  @override
  Widget build(BuildContext context) {
    CustomUser currentUser = Provider.of<AppState>(context).currentUser;

    return StreamBuilder<List<CustomUser>>(
        // Case-sensitive search based on @userName
        // If want case-insensitive search, would need to add lowercaseName field I think
        stream: getMatchingUsers(widget.searchText, currentUser),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              final users = snapshot.data!;
              return ListView(
                shrinkWrap: true,
                children: users.map(
                  // Loop through all users in stream result and do following to each:
                  (user) {
                    return GestureDetector(
                      // When click on user, go to user's profile
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/Profile');
                      },
                      child: UsersSearchResultsWidget(
                        name: user.displayName,
                        username: user.userName,
                        imgUrl: user.imageUrl,
                        isVerified: user.isVerified,
                        userID: user.userID,
                      ),
                    );
                  },
                ).toList(),
              );
            } else {
              return Container();
          }
        });
  }
}
