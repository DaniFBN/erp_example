import 'package:flutter/material.dart';

import '../../../../design_system.dart';

class DsSideBar extends StatelessWidget {
  final double width;
  final VoidCallback onThemeTap;
  final VoidCallback onLogoutTap;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const DsSideBar({
    super.key,
    required this.onThemeTap,
    required this.onLogoutTap,
    required this.itemCount,
    required this.itemBuilder,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      color: colorScheme.primary,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              separatorBuilder: (_, __) => SizedBox(height: Responsive.size(8)),
            ),
          ),
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
