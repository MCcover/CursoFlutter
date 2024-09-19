import 'package:flutter/material.dart';

class BlocPage extends StatelessWidget {
  static const name = 'bloc-page';

  const BlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cubit Counter Strike'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          '0',
          style: TextStyle(fontSize: 80),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: '1',
            onPressed: () {},
            child: const Text('+3'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '2',
            onPressed: () {},
            child: const Text('+2'),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            heroTag: '3',
            onPressed: () {},
            child: const Text('+1'),
          ),
        ],
      ),
    );
  }
}
