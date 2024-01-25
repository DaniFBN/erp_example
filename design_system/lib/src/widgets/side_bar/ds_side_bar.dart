import 'package:flutter/material.dart';

class DsSideBar extends StatelessWidget {
  final VoidCallback onTap;
  final VoidCallback onThemeTap;
  final VoidCallback onLogoutTap;

  const DsSideBar({
    super.key,
    required this.onThemeTap,
    required this.onLogoutTap,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      color: colorScheme.primary,
      child: Column(
        children: [
          IconButton(
            onPressed: onTap,
            icon: Icon(Icons.add, color: theme.primaryIconTheme.color),
          ),
          const Spacer(),
          const CircleAvatar(
            backgroundColor: Colors.red,
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: onThemeTap,
            icon: Icon(Icons.light_mode, color: theme.primaryIconTheme.color),
          ),
          const SizedBox(height: 8),
          IconButton(
            onPressed: onLogoutTap,
            icon: Icon(Icons.logout, color: theme.primaryIconTheme.color),
          ),
        ],
      ),
    );
  }
}
