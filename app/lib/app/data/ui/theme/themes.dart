
import 'package:flutter/material.dart';

ThemeData get lightTheme => ThemeData.light().copyWith(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: Colors.lightBlue,
    secondary: Colors.lightBlue.shade200,
    error: Colors.lightBlueAccent,
  ),
  elevatedButtonTheme: elevatedButtonTheme,
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    disabledBackgroundColor: Colors.lightBlue.withOpacity(.8),
    disabledForegroundColor: Colors.white70,
  ),
);
