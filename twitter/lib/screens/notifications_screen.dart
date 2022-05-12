import 'package:flutter/material.dart';
import '../widgets/bottom_bar_menu.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({ Key? key }) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Notifications'),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
