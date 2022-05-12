import 'package:flutter/material.dart';
import '../widgets/bottom_bar_menu.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({ Key? key }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text('Search'),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
