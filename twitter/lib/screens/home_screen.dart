import 'package:flutter/material.dart';
import '../widgets/side_bar_menu.dart';
import '../widgets/bottom_bar_menu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
        title: const Text('Home'),
      ),
      drawer: const SideBarMenu(),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
