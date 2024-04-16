import 'package:flutter/material.dart';
import 'dart:math';

class AnimatedPage extends StatefulWidget {
  const AnimatedPage({super.key});

  @override
  State<AnimatedPage> createState() => _AnimatedPageState();
}

class _AnimatedPageState extends State<AnimatedPage> {
  void handleFabClick() {
    var rnd = Random();
    _width = rnd.nextInt(300) + 100;
    _height = rnd.nextInt(500) + 100;
    _radious = rnd.nextInt(100) + 20;

    var red = rnd.nextInt(255);
    var green = rnd.nextInt(255);
    var blue = rnd.nextInt(255);
    var opacity = rnd.nextInt(255) + 100;

    _color = Color.fromARGB(opacity, red, green, blue);
    setState(() {});
  }

  double _height = 100;
  double _width = 100;
  Color _color = Colors.indigo;
  double _radious = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated'),
      ),
      body: Center(
        child: InkWell(
          onTap: () => handleFabClick(),
          hoverColor: const Color.fromARGB(0, 255, 255, 255),
          focusColor: const Color.fromARGB(0, 255, 255, 255),
          highlightColor: const Color.fromARGB(0, 255, 255, 255),
          splashColor: const Color.fromARGB(0, 255, 255, 255),
          child: AnimatedContainer(
            curve: Curves.easeOutCubic,
            duration: const Duration(milliseconds: 500),
            height: _height,
            width: _width,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: BorderRadius.circular(_radious),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleFabClick(),
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
