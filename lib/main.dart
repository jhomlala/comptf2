import 'package:comptf2/view/main_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(CompTF2App());

class CompTF2App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
      debugShowCheckedModeBanner: false,
      theme: _configureThemeData(),
    );
  }

  ThemeData _configureThemeData() {
    return ThemeData(
        textTheme: TextTheme(
            headline: TextStyle(fontSize: 60.0, color: Colors.black),
            title: TextStyle(fontSize: 35, color: Colors.black),
            subtitle: TextStyle(fontSize: 20, color: Colors.black),
            body1: TextStyle(fontSize: 15, color: Colors.black),
            body2: TextStyle(fontSize: 12, color: Colors.black)));
  }
}
