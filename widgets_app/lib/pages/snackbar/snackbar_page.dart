import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarPage extends StatelessWidget {
  const SnackbarPage({super.key});

  void handleMostarSnackbarClick(BuildContext context) {
    var scaffoldState = ScaffoldMessenger.of(context);

    scaffoldState.clearSnackBars();
    scaffoldState.showSnackBar(
      const SnackBar(
        content: Text("Holaaa, vine a flotar. Hohoho"),
        showCloseIcon: true,
        duration: Duration(
          seconds: 2,
        ),
      ),
    );
  }

  void handleLicenciasUsadasClick(BuildContext context) {
    return showAboutDialog(
      context: context,
      children: [
        const Text(
            'Irure veniam ipsum commodo ex pariatur dolor minim. Amet qui reprehenderit sint ex in mollit dolore tempor dolore duis exercitation fugiat ipsum fugiat. Velit eiusmod sit commodo in velit nulla reprehenderit consequat nulla.'),
      ],
    );
  }

  void handleMostrarDialogoClick(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text(
            'Proident id aute id officia voluptate eiusmod enim veniam labore fugiat occaecat consectetur anim eiusmod. Reprehenderit reprehenderit occaecat id veniam magna dolor deserunt in laborum dolore. Laboris incididunt in deserunt ullamco proident ut esse ea est occaecat Lorem fugiat reprehenderit aliqua. Incididunt laboris ut qui reprehenderit nostrud do sit.'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () => context.pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbar y dialogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => handleLicenciasUsadasClick(context),
              child: const Text("Licencias usadas"),
            ),
            const SizedBox(
              height: 20,
            ),
            FilledButton.tonal(
              onPressed: () => handleMostrarDialogoClick(context),
              child: const Text("Mostrar dialogos"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => handleMostarSnackbarClick(context),
        icon: const Icon(Icons.remove_red_eye_outlined),
        label: const Text('Mostrar Snackbar'),
      ),
    );
  }
}
