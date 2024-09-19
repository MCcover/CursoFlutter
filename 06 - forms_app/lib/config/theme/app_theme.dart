import 'package:flutter/material.dart';

class AppTheme {
  final seedColor = Colors.deepPurple;

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0x0ff286f5),
        listTileTheme: ListTileThemeData(
          iconColor: seedColor,
        ),
      );
}
