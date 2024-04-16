import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.purple,
  Colors.deepPurple,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.indigo,
  Colors.teal,
  Colors.pink,
  Colors.amber,
];

class AppTheme {
  final int selectedColor;
  final bool isDarkMode;
  AppTheme({
    this.selectedColor = 0,
    this.isDarkMode = false,
  });

  ThemeData getTheme() => ThemeData(
        brightness: isDarkMode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectedColor],
        appBarTheme: const AppBarTheme(
          centerTitle: false,
        ),
      );

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) =>
      AppTheme(
        selectedColor: selectedColor ?? this.selectedColor,
        isDarkMode: isDarkMode ?? this.isDarkMode,
      );
}
