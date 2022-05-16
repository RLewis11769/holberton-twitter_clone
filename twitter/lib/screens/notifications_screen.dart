import 'package:flutter/material.dart';
import '../widgets/bottom_bar_menu.dart';

class NotificationsScreen extends StatelessWidget {
  // No props needed
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(children: [
        Container(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Column(children: [
              // Always stays the same - profile image, title, settings icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'http://static.wikia.nocookie.net/blossom/images/e/ed/Mange.png/revision/latest?cb=20140731004033'),
                    radius: 20,
                  ),
                  Flexible(
                      child: Text(
                    'Notifications',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Theme.of(context).primaryColorDark),
                  )),
                  const Icon(Icons.settings_outlined,
                        color: Colors.blue, size: 30),
                ],
              ),
            ])),
        // Filler info while no notifications
        // Needs to be flexible so text can be wrapped
        Flexible(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            color: Colors.grey[200],
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "No Notifications available yet",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Theme.of(context).primaryColorDark,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "When new notifications are found, they'll show up here",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: Theme.of(context).primaryColorLight,
                          height: 1.5),
                    )
                  ]),
            ),
          ),
        ),
      ])),
      // Always includes bottom nav bar
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
