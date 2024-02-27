import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/theme_button_component.dart';

class HomeMobileLayout extends StatelessWidget {
  final ThemeStore themeStore;

  const HomeMobileLayout({
    super.key,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DsMenuBar(
        // TODO(danifbn): Intl
        title: const Text('User'),
        itemCount: 3,
        width: 300,
        itemBuilder: (BuildContext context, int index) {
          return DsMenuBarItem(
            icon: Icons.add,
            // TODO(danifbn): Intl
            title: 'Whatever',
            onTap: () {},
          );
        },
      ),
      appBar: DsAppBar(
        actions: [
          ThemeButtonComponent(themeStore: themeStore),
        ],
        // TODO(danifbn): Intl
        title: 'Home',
      ),
    );
  }
}
