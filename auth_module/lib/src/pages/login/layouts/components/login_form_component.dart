import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class LoginFormComponent extends StatefulWidget {
  const LoginFormComponent({super.key});

  @override
  State<LoginFormComponent> createState() => _LoginFormComponentState();
}

class _LoginFormComponentState extends State<LoginFormComponent> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Form(
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
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Responsive.size(12)),
              DsPasswordField(
                controller: passwordController,
                label: 'Senha',
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
                onPressed: () {},
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: Responsive.size(20)),
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
