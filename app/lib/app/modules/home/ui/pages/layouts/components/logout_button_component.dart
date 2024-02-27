import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LogoutButtonComponent extends StatelessWidget {
  final UserStore userStore;

  const LogoutButtonComponent({
    super.key,
    required this.userStore,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: userStore.logout,
      icon: const Icon(Icons.logout),
    );
  }
}
