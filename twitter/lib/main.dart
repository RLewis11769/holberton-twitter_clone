import 'package:flutter/material.dart';
// import '../screens/home_screen.dart';
import '../screens/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Styling using Material App
    return MaterialApp(
      title: 'Twitter Clone',
      // Custom theme that overrides/extends default theme
      theme: ThemeData(
        primaryColor: Colors.blue,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.grey,
        textTheme: const TextTheme(
          headline4: TextStyle(fontSize: 27.5, fontWeight: FontWeight.w500),
          headline6: TextStyle(fontSize: 20),
          subtitle1: TextStyle(fontSize: 20),
          bodyText1: TextStyle(fontSize: 25),
          bodyText2: TextStyle(fontSize: 18, height: 2.5),
          button: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
      // Home page defined by SignIn widget
      home: const SignIn(),
    );
  }
}
