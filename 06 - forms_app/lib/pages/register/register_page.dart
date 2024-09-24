import 'package:flutter/material.dart';
import 'package:forms_app/widgets/inputs/custom_text_form_field.dart';

class RegisterPage extends StatelessWidget {
  static const name = 'register-page';

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo Usuario'),
      ),
      body: const _RegisterView(),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlutterLogo(size: 100),
              _RegisterForm(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class _RegisterForm extends StatefulWidget {
  const _RegisterForm();

  @override
  State<_RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<_RegisterForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailRegExp = RegExp(
    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  );
  String username = '';
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFormField(
            label: 'Usuario',
            onChanged: (value) => username = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo Requerido';

              if (value.length < 6) {
                return 'Al menos 6 letras';
              }

              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Email',
            onChanged: (value) => email = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo Requerido';

              if (!emailRegExp.hasMatch(value)) {
                return 'Email invalido';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            label: 'Contraseña',
            isPassword: true,
            onChanged: (value) => password = value,
            validator: (value) {
              if (value == null || value.isEmpty || value.trim().isEmpty) return 'Campo Requerido';

              if (value.length < 6) {
                return 'Al menos 6 letras';
              }

              return null;
            },
          ),
          const SizedBox(height: 20),
          FilledButton.tonalIcon(
            onPressed: () {
              final isValid = _formKey.currentState!.validate();

              if (!isValid) {
                return;
              }

              print(username);
              print(email);
              print(password);
            },
            icon: const Icon(Icons.save),
            label: const Text('Crear Usuario'),
          ),
        ],
      ),
    );
  }
}
