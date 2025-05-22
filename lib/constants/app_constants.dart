import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryGreen = Color(0xFF00AA13);
  static const Color lightGreen = Color(0xFFD8FFBC);
  static const Color darkGreen = Color(0xFF008C10);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Color(0xFFE8E8E8);
  static const Color darkGrey = Color(0xFF757575);
  static const Color red = Color(0xFFFF5252);
  static const Color blue = Color(0xFF00BCD4);
  static const Color backgroundColor = Colors.white;
}

class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );
  
  static const TextStyle subheading = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.black,
  );
  
  static const TextStyle body = TextStyle(
    fontSize: 14.0,
    color: AppColors.black,
  );
  
  static const TextStyle caption = TextStyle(
    fontSize: 12.0,
    color: AppColors.darkGrey,
  );
  
  static const TextStyle buttonText = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );
} 