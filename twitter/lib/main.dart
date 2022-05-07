import 'package:flutter/material.dart';
// import '../widgets/entry_field.dart';
import 'home.dart';

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
        primarySwatch: Colors.blue,
      ),
      // Home page defined by HomeScreen widget
      home: const HomeScreen(),
    );
  }
}
