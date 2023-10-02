import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  fontFamily: 'Montserrat',
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Color.fromARGB(255, 20, 20, 20)!,
    primary: Color.fromARGB(255, 35, 35, 35)!,
    secondary: Colors.grey[850]!,
    tertiary: Colors.blueGrey[750],
  ),
  appBarTheme: AppBarTheme(
    actionsIconTheme: IconThemeData(
      color: Colors.white
    ),
    backgroundColor: Colors.transparent
  ),
  
);