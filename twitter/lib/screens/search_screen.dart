import 'package:flutter/material.dart';
import 'package:twitter/screens/home_screen.dart';
import '../widgets/users_search_results_widget.dart';
import '../widgets/bottom_bar_menu.dart';
import '../assets/user_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SafeArea fills space at top of screen so content starts below time/battery info
      body: SafeArea(
        child: Column(
          children: [
            Row(
              // Always stays the same - profile image, search bar, settings icon
              // Similar to notifications_screen but with search bar
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.fromLTRB(10, 20, 20, 20),
                    child: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://static.wikia.nocookie.net/blossom/images/e/ed/Mange.png/revision/latest?cb=20140731004033'),
                      radius: 20,
                    )),
                // Near-identical to entry_field but with no props
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
                GestureDetector(
                  // On tap of text, navigate to sign up screen as on notifications_screen and chats_screen
                  // Not asked to do this but I wanted it - no other way to get to SignIn if home is HomeScreen
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                    child: const Icon(Icons.settings_outlined,
                        color: Colors.blue, size: 30),
                  ),
                ),
              ],
            ),
            Expanded(
              // ListView builder to display search results from userList file
              //
              child: ListView.builder(
                  // itemCount required to be able to build list
                  // If itemBuilder has static info, makes identical number of items in itemCount
                  itemCount: userList.length,
                  // context is BuildContext instance that lets builder know where it is in Widget Tree
                  // Required information used in background
                  // index of item in list based on itemCount
                  itemBuilder: (BuildContext context, int index) {
                    return UsersSearchResultsWidget(
                      // Pass userList info at that key to each UsersSearchResultsWidget
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
