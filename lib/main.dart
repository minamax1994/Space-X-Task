import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:space_x/home/home_screen.dart';
import 'package:space_x/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appTitle = 'Space-X';

  final themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    backgroundColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    appBarTheme: AppBarTheme(
      elevation: 0.0,
      centerTitle: true,
      color: AppColors.primaryColor,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appTitle,
      theme: themeData,
      home: HomeScreen(),
    );
  }
}
