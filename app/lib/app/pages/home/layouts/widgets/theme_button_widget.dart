import 'package:flutter/material.dart';

class ThemeButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const ThemeButtonWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.light_mode),
      onPressed: onTap,
    );
  }
}
