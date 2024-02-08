import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../domain/stores/events/login_event.dart';
import '../../../../domain/stores/login_store.dart';

class LoginFormComponent extends StatefulWidget {
  final LoginStore loginStore;

  const LoginFormComponent({
    super.key,
    required this.loginStore,
  });

  @override
  State<LoginFormComponent> createState() => _LoginFormComponentState();
}

class _LoginFormComponentState extends State<LoginFormComponent> {
  final formKey = GlobalKey<FormState>();
  final emailController =
      TextEditingController(text: 'daniel.noronha@fteam.dev');
  final passwordController = TextEditingController(text: '12345678A');

  void login() {
    final isValid = formKey.currentState!.validate();

    if (!isValid) return;

    widget.loginStore.add(
      SubmitLoginEvent(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!RegExp(r'[0-9]+').hasMatch(value)) {
      return 'A senha deve conter um numero';
    }

    if (!RegExp(r'[a-zA-Z]+').hasMatch(value)) {
      return 'A senha deve conter uma letra';
    }

    if (value.length < 8) {
      return 'Senha muito pequena';
    }

    return null;
  }

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    }

    if (!value.contains('@')) {
      return 'Insira um email válido';
    }

    return null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Form(
        key: formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.size(20),
            vertical: Responsive.size(20),
          ),
          child: Column(
            children: [
              Text(
                'Entrar',
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: Responsive.size(20)),
              DsTextField(
                controller: emailController,
                label: 'Email',
                prefix: const Icon(Icons.email_outlined),
                validator: emailValidator,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Responsive.size(12)),
              DsPasswordField(
                controller: passwordController,
                label: 'Senha',
                validator: passwordValidator,
                prefix: const Icon(Icons.password),
                autofillHints: const [AutofillHints.password],
                keyboardType: TextInputType.visiblePassword,
              ),
              SizedBox(height: Responsive.size(12)),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Esqueci minha senha'),
                ),
              ),
              SizedBox(height: Responsive.size(20)),
              ElevatedButton(
                onPressed: login,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.size(20),
                  ),
                  child: const Text('Entrar'),
                ),
              ),
              SizedBox(height: Responsive.size(40)),
              TextButton(
                onPressed: () {},
                child: const Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
