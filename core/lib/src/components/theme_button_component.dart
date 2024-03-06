import 'package:core/core.dart';
import 'package:flutter/material.dart';

class ThemeButtonComponent extends StatelessWidget {
  final ThemeStore themeStore;

  const ThemeButtonComponent({
    super.key,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: themeStore,
      builder: (context, state, child) {
        return IconButton(
          icon: Icon(themeStore.isLight ? Icons.dark_mode : Icons.light_mode),
          onPressed: themeStore.toggle,
        );
      },
    );
  }
}
