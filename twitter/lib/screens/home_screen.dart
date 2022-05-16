import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import '../providers/auth_state.dart';
import '../widgets/side_bar_menu.dart';
import '../widgets/bottom_bar_menu.dart';
import '../screens/signin_screen.dart';
import '../widgets/post_widget.dart';

class HomeScreen extends StatefulWidget {
  // Not using state yet but will in future?
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (FirebaseAuth.instance.currentUser == null) {
        return const SignIn();
    } else {
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
}
