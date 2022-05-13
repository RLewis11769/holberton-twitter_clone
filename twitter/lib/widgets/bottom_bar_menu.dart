import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/app_state.dart';
import '../screens/home_screen.dart';
import '../screens/search_screen.dart';
import '../screens/notifications_screen.dart';
import '../screens/chats_screen.dart';

class BottomMenuBar extends StatefulWidget {
  const BottomMenuBar({Key? key}) : super(key: key);

  @override
  State<BottomMenuBar> createState() => _BottomMenuBarState();
}

class _BottomMenuBarState extends State<BottomMenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 15, 0, 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).setpageIndex =
                      0;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: Icon(
                  Icons.home_outlined,
                  color: Provider.of<AppState>(context).pageIndex == 0
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                )),
            GestureDetector(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).setpageIndex =
                      1;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SearchScreen()),
                  );
                },
                child: Icon(
                  Icons.search,
                  color: Provider.of<AppState>(context).pageIndex == 1
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                )),
            GestureDetector(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).setpageIndex =
                      2;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NotificationsScreen()),
                  );
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Provider.of<AppState>(context).pageIndex == 2
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                )),
            GestureDetector(
                onTap: () {
                  Provider.of<AppState>(context, listen: false).setpageIndex =
                      3;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChatsScreen()),
                  );
                },
                child: Icon(
                  Icons.email_outlined,
                  color: Provider.of<AppState>(context).pageIndex == 3
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColorLight,
                )),
          ],
        ));
  }
}
