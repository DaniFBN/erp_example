import 'package:flutter/material.dart';

import '../../../design_system.dart';

class DarkTheme {
  static final theme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color.fromRGBO(63, 81, 181, 1),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.indigo,
      titleTextStyle: TextStyle(color: Colors.white),
      actionsIconTheme: IconThemeData(
        color: Colors.white,
      ),
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Responsive.size(8)),
        ),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
    ),
  );
}
