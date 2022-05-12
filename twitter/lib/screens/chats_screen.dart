import 'package:flutter/material.dart';
import '../widgets/bottom_bar_menu.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({ Key? key }) : super(key: key);

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Chats'),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}