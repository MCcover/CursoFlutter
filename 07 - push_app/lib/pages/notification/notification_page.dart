import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  static const name = 'notification-page';

  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Permisos"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: const Placeholder(),
    );
  }
}
