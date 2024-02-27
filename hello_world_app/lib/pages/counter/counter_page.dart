import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _clickCounter = 0;

  void add() {
    setState(() {
      _clickCounter++;
    });
  }

  void substract() {
    setState(() {
      _clickCounter--;
    });
  }

  void reset() {
    setState(() {
      _clickCounter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.plus_one),
            onPressed: add,
          ),
          IconButton(
            icon: const Icon(Icons.exposure_minus_1),
            onPressed: substract,
          ),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: reset,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Click${((_clickCounter == 1 || _clickCounter == -1) ? '' : 's')}: ",
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w100),
            ),
            Text(
              '$_clickCounter',
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomFabButton(
            icon: Icons.plus_one,
            onPress: add,
          ),
          const SizedBox(height: 10),
          CustomFabButton(
            icon: Icons.exposure_minus_1,
            onPress: substract,
          ),
          const SizedBox(height: 10),
          CustomFabButton(
            icon: Icons.restart_alt,
            onPress: reset,
          ),
        ],
      ),
    );
  }
}

class CustomFabButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  final bool isRounded;

  const CustomFabButton(
      {super.key,
      required this.icon,
      required this.onPress,
      this.isRounded = false});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: isRounded ? const StadiumBorder() : null,
      onPressed: onPress,
      child: Icon(icon),
    );
  }
}
