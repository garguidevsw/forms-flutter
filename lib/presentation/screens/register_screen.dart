import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formapp/presentation/blocs/register_cubit/register_cubit.dart';
import 'package:formapp/presentation/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nuevo usuario'),
      ),
      body: BlocProvider(
        create: (_) => RegisterCubit(),
        child: const _RegisterView(),
      ),
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

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>();
    final username = registerCubit.state.username;
    final password = registerCubit.state.password;
    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChanged: registerCubit.usernameChanged,
          errorMessage:
              username.isPure || username.isValid ? null : 'Usuario no valido',
        ),
        const SizedBox(height: 20),
        CustomTextFormField(
          label: 'Correo Electrónico',
          onChanged: (value) {
            registerCubit.emailChanged(value);
          },
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
          onChanged: registerCubit.passwordChanged,
        ),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            // final isValid = _formKey.currentState!.validate();

            // if (!isValid) return;

            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.app_registration_rounded),
          label: const Text('Registrar usuario'),
        ),
      ],
    ));
  }
}
