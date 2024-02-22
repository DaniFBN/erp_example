import 'package:flutter/material.dart';

class DsAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;

  /// É uma [String]
  final String title;

  /// Isso é um [StatelessWidget]
  const DsAppBar({
    super.key,
    required this.actions,
    required this.title,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: actions,
    );
  }
}
