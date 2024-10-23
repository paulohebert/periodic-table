import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color(0xFFFAFAFA),
        elevation: 2,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
        shadowColor: Colors.black),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFFFAFAFA),
      shadowColor: Colors.black,
      surfaceTintColor: Colors.white,
    ),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5));

ThemeData darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
        surfaceTintColor: Colors.transparent,
        backgroundColor: Color(0xFF212121),
        elevation: 2,
        titleTextStyle: TextStyle(fontSize: 20, color: Colors.white),
        shadowColor: Colors.white38),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF212121), foregroundColor: Colors.white),
    bottomAppBarTheme: const BottomAppBarTheme(
      color: Color(0xFF212121),
      shadowColor: Colors.white,
      surfaceTintColor: Colors.black,
    ),
    scaffoldBackgroundColor: const Color(0xFF212121));
