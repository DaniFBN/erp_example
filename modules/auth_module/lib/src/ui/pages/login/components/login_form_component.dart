import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

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
    final translate = AppLocalizations.of(context);

    if (value == null || value.isEmpty) {
      return translate.requiredField;
    }

    if (!RegExp(r'[0-9]+').hasMatch(value)) {
      return translate.passwordRequireNumber;
    }

    if (!RegExp(r'[a-zA-Z]+').hasMatch(value)) {
      return translate.passwordRequireLetter;
    }

    if (value.length < 8) {
      return translate.password;
    }

    return null;
  }

  String? emailValidator(String? value) {
    final translate = AppLocalizations.of(context);
    if (value == null || value.isEmpty) {
      return translate.requiredField;
    }

    if (!value.contains('@')) {
      return translate.emailInvalid;
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
    final translate = AppLocalizations.of(context);
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
                translate.enter,
                style: theme.textTheme.headlineMedium,
              ),
              SizedBox(height: Responsive.size(20)),
              DsTextField(
                controller: emailController,
                label: translate.email,
                prefix: const Icon(Icons.email_outlined),
                validator: emailValidator,
                autofillHints: const [AutofillHints.email],
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: Responsive.size(12)),
              DsPasswordField(
                controller: passwordController,
                label: translate.password,
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
                  child: Text(translate.forgotPassword),
                ),
              ),
              SizedBox(height: Responsive.size(20)),
              ElevatedButton(
                onPressed: login,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: Responsive.size(20),
                  ),
                  child: Text(translate.enter),
                ),
              ),
              SizedBox(height: Responsive.size(40)),
              TextButton(
                onPressed: () {},
                child: Text(translate.register),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
