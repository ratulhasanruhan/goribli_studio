import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF3498db); // Bright Blue
  static const Color secondaryColor = Color(0xFFecf0f1); // Light Gray
  static const Color textColor = Color(0xFF2c3e50); // Dark Gray
  static const Color accentColor = Color(0xFF2ecc71); // Vibrant Green
  static const Color errorColor = Color(0xFFe74c3c); // Strong Red

  // MaterialColor from primaryColor (if you need it for theme)
  static MaterialColor primarySwatch = MaterialColor(
    0xFF3498db, // Replace with your primary color value
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: primaryColor, // 0xFF3498db
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}