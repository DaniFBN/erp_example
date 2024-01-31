import 'package:flutter/material.dart';

import '../../../../design_system.dart';

class DsSideBar extends StatelessWidget {
  final double width;
  final VoidCallback onThemeTap;
  final VoidCallback onLogoutTap;
  final int itemCount;
  final Widget trailing;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const DsSideBar({
    super.key,
    required this.onThemeTap,
    required this.onLogoutTap,
    required this.itemCount,
    required this.itemBuilder,
    required this.width,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      color: theme.appBarTheme.backgroundColor,
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: itemCount,
              itemBuilder: itemBuilder,
              separatorBuilder: (_, __) => SizedBox(height: Responsive.size(8)),
            ),
          ),
          IconTheme(
            data: theme.appBarTheme.actionsIconTheme!,
            child: trailing,
          ),
        ],
      ),
    );
  }
}
