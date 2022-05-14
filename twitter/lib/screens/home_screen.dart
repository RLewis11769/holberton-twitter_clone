import 'package:flutter/material.dart';
import '../widgets/side_bar_menu.dart';
import '../widgets/bottom_bar_menu.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  // Not using state yet but will in future?
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
      // Currently not supposed to add anything to body but adding PostWidget so can see what looks like
      body: const PostWidget(
        name: 'Shadow',
        username: 'themangeonlycomesoutatnight',
        imgUrl:
            'https://static.wikia.nocookie.net/blossom/images/e/ed/Mange.png/revision/latest?cb=20140731004033',
        isVerified: true,
        postText:
            'I have studied many philosophers and many cats. The wisdom of cats is infinitely superior. #HippolyteTaine',
      ),
      // HomeScreen is only screen to have side menu drawer
      drawer: const SideBarMenu(),
      bottomNavigationBar: const BottomMenuBar(),
    );
  }
}
