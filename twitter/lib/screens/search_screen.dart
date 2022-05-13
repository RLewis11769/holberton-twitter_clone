import 'package:flutter/material.dart';
import '../widgets/users_search_results_widget.dart';
import '../widgets/bottom_bar_menu.dart';
import '../assets/user_list.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://static.wikia.nocookie.net/blossom/images/e/ed/Mange.png/revision/latest?cb=20140731004033'),
                      radius: 20,
                    )),
                Flexible(
                    child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    // Background and color
                    filled: true,
                    fillColor: Colors.grey[200],
                    // Hint/placeholder text
                    hintStyle: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: 20),
                    // Padding around text itself within field
                    contentPadding: const EdgeInsets.fromLTRB(30, 15, 0, 15),
                    // Border around field
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: (Colors.grey[200])!),
                    ),
                    // Border around field when focused
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                          color: Theme.of(context).primaryColor, width: 2),
                    ),
                  ),
                )),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                  child: const Icon(Icons.settings_outlined,
                      color: Colors.blue, size: 30),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return UsersSearchResultsWidget(
                      name: userList[index]['name'],
                      username: userList[index]['username'],
                      imgUrl: userList[index]['imgUrl'],
                      isVerified: userList[index]['isVerified'],
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
