import 'package:flutter/material.dart';

import '../../../../design_system.dart';

class DsMenuBar extends StatelessWidget {
  final double width;
  final String title;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  const DsMenuBar({
    super.key,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: width,
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Responsive.size(20)),
          bottomRight: Radius.circular(Responsive.size(20)),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: Responsive.size(20),
          horizontal: Responsive.size(12),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: theme.textTheme.titleLarge,
            ),
            SizedBox(height: Responsive.size(20)),
            Expanded(
              child: ListView.separated(
                itemCount: itemCount,
                itemBuilder: itemBuilder,
                separatorBuilder: (_, __) => SizedBox(
                  height: Responsive.size(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
