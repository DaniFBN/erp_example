import 'package:flutter/material.dart';

class DsMenuBar extends StatelessWidget {
  const DsMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      color: colorScheme.secondary,
      child: Column(
        children: List.generate(
          5,
          (index) => Card(
            child: Text('Item $index'),
          ),
        ),
      ),
    );
  }
}
