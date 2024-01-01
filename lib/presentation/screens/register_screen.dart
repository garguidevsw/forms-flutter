import 'package:flutter/material.dart';
import 'package:formapp/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
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
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
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
              label: 'Nombre de usuario',
              onChanged: (value) => username = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) {
                  return 'El campo debe contener al menos 6 carácteres';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Correo Electrónico',
              onChanged: (value) => email = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';

                final emailRegExp = RegExp(
                  r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                );

                if (!emailRegExp.hasMatch(value)) {
                  return 'El campo debe ser un email valido';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            CustomTextFormField(
              label: 'Contraseña',
              obscureText: true,
              onChanged: (value) => password = value,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Campo requerido';
                if (value.trim().isEmpty) return 'Campo requerido';
                if (value.length < 6) {
                  return 'El campo debe contener al menos 6 carácteres';
                }

                return null;
              },
            ),
            const SizedBox(height: 20),
            FilledButton.tonalIcon(
              onPressed: () {
                final isValid = _formKey.currentState!.validate();

                if (!isValid) return;
              },
              icon: const Icon(Icons.app_registration_rounded),
              label: const Text('Registrar usuario'),
            ),
          ],
        ));
  }
}
