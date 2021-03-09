import 'package:flutter/material.dart';

// All theme data used in app in one place for easier changes.

class AppColors {
  static const Color primaryColor = Color(0xFF003152);
  static const Color primaryContrastingColor = Color(0xFFE6EEF3);
  static const Color secondaryColor = Color(0xFF898B8E);
  static const Color backgroundColor = Color(0xFFF6F6F7);
}

class AppStyles {
  static const TextStyle headerStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleStyle = TextStyle(
    color: AppColors.primaryColor,
    fontSize: 20,
  );

  static const TextStyle subtitleStyle = TextStyle(
    color: AppColors.secondaryColor,
    fontSize: 16,
  );
}
