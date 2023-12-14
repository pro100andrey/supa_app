import 'package:flutter/material.dart';

ThemeData get lightTheme {
  final theme = ThemeData.light();
  return theme.copyWith(
    colorScheme: theme.colorScheme.copyWith(
      primary: Colors.lightBlue,
      secondary: Colors.lightBlueAccent,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: Colors.lightBlue.withOpacity(.8),
        disabledForegroundColor: Colors.white70,
      ),
    ),
  );
}
