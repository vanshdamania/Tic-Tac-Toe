import 'package:flutter/material.dart';
import 'HomePage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTacToe Game ',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.redAccent,
      ),
      home: HomePage(),
    );
  }
}