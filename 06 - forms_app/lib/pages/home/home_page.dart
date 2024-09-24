import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cubits'),
            subtitle: const Text('Gestor de estados simple'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/cubits'),
          ),
          ListTile(
            title: const Text('Bloc'),
            subtitle: const Text('Gestor de estados compuesto'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/bloc'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Nuevo Usuario'),
            subtitle: const Text('Formulario'),
            trailing: const Icon(Icons.arrow_forward_ios_outlined),
            onTap: () => context.push('/register'),
          ),
        ],
      ),
    );
  }
}
