import 'package:flutter/material.dart';

class DsSideBarItem extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool isSelected;

  const DsSideBarItem({
    super.key,
    required this.icon,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final iconTheme = theme.iconTheme;
    final primaryIconTheme = theme.primaryIconTheme;
    final colorScheme = theme.colorScheme;

    return IconButton(
      color: isSelected ? iconTheme.color : primaryIconTheme.color,
      style: IconButton.styleFrom(
        backgroundColor:
            isSelected ? colorScheme.primaryContainer : colorScheme.primary,
      ),
      onPressed: onTap,
      icon: const Icon(Icons.add),
    );
  }
}
