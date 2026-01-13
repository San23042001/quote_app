import 'package:flutter/material.dart';
import 'package:quote_app/core/app_color.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: const Color(0xFFF7F3FF),
      fontFamily: 'Serif',
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.grey,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: AppColors.scaffoldBackground,
        titleTextStyle: TextStyle(
          fontFamily: 'Serif',
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
      ),
    );
  }
}
