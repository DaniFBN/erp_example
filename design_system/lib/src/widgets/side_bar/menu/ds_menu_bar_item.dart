import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../design_system.dart';

class DsMenuBarItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const DsMenuBarItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<DsMenuBarItem> createState() => _DsMenuBarItemState();
}

class _DsMenuBarItemState extends State<DsMenuBarItem> {
  bool onHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final primaryTextTheme = theme.primaryTextTheme;
    final primaryIconTheme = theme.primaryIconTheme;
    final colorScheme = theme.colorScheme;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => onHover = true),
      onExit: (_) => setState(() => onHover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          constraints: const BoxConstraints(minHeight: 48),
          duration: const Duration(milliseconds: 300),
          padding: EdgeInsets.symmetric(
            horizontal: Responsive.size(8),
            vertical: Responsive.size(4),
          ),
          decoration: BoxDecoration(
            color: onHover ? colorScheme.primary : null,
            borderRadius: BorderRadius.all(
              Radius.circular(Responsive.size(8)),
            ),
          ),
          child: Row(
            children: [
              Icon(
                widget.icon,
                color: onHover ? primaryIconTheme.color : null,
              ),
              SizedBox(width: Responsive.size(8)),
              Expanded(
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: onHover
                      ? primaryTextTheme.bodyMedium!
                      : textTheme.bodyMedium!,
                  child: Text(
                    widget.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
