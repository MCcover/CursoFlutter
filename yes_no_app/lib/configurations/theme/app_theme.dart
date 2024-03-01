import 'package:flutter/material.dart';

enum ColorsEnum {
  blue,
  purple,
  yellow,
  brown
}

const Map<ColorsEnum, Color> _colors = {
  ColorsEnum.blue: Colors.blue,
  ColorsEnum.purple: Colors.deepPurple,
  ColorsEnum.yellow: Colors.yellow,
  ColorsEnum.brown: Colors.brown
};


class AppTheme {
  final ColorsEnum selectedColor;

  AppTheme({this.selectedColor = ColorsEnum.blue});

  ThemeData theme() {
    return ThemeData(
        colorSchemeSeed: _colors[selectedColor], brightness: Brightness.light);
  }
}
