import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        elevation: 4,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        shadowColor: Colors.black),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Colors.white,
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white);

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.grey[900],
        elevation: 2,
        titleTextStyle: const TextStyle(fontSize: 20, color: Colors.white),
        shadowColor: Colors.white38),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.grey[900], foregroundColor: Colors.white),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.grey[900],
      shadowColor: Colors.white,
      surfaceTintColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.grey[900]);
