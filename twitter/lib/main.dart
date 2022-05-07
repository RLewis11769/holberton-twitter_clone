import 'package:flutter/material.dart';
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
      // Usually wrap text in Text widget? Might be updated syntax
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.green,
        primaryColorDark: Colors.black,
        primaryColorLight: Colors.white,
        // fontFamily: GoogleFonts.mulish().fontFamily,
        textTheme: const TextTheme(
          // caption: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          headline4: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          bodyText1: TextStyle(fontSize: 18, height: 2.5),
          button: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
        ),
      ),
      // Home page defined by HomeScreen widget
      home: const SignIn(),
    );
  }
}
