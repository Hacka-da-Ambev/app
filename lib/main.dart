import 'package:app/screens/home.dart';
import 'package:app/screens/nini.dart';
import 'package:app/screens/suggestions.dart';
import 'package:app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      routes: {
        '/': (context) => Home(),
        '/nini': (context) => Nini(),
        '/suggestions': (context) => Suggestions(),
      },
    );
  }
}