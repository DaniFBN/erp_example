import 'package:core/core.dart';
import 'package:flutter/material.dart';

class LogoutButtonWidget extends StatelessWidget {
  final UserStore userStore;

  const LogoutButtonWidget({
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
