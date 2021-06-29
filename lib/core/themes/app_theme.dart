import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      primaryColor: Colors.black,
      accentColor: HexColor('#EC8DAB'),
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
