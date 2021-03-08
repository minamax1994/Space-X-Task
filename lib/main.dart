import 'package:flutter/cupertino.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'Space-X',
      theme: CupertinoThemeData(
        primaryColor: Color(0xFF005288),
        primaryContrastingColor: Color(0xFFE6EEF3),
        scaffoldBackgroundColor: Color(0xFFA7A9AC),
      ),
      home: HomeScreen(),
    );
  }
}
