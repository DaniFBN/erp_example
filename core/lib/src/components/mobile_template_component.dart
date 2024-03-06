import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:l10n/l10n.dart';

import '../../core.dart';
import '../core/models/drawer_model.dart';
import 'theme_button_component.dart';

class MobileTemplateComponent extends StatelessWidget {
  final String title;
  final Widget body;
  final ThemeStore themeStore;
  final Widget? floatingActionButton;

  const MobileTemplateComponent({
    super.key,
    required this.title,
    required this.body,
    required this.themeStore,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);

    return Scaffold(
      drawer: DsMenuBar(
        // TODO(danifbn): Intl
        title: const Text('User'),
        itemCount: drawerItems.length,
        width: 300,
        itemBuilder: (BuildContext context, int index) {
          final item = drawerItems.elementAt(index);

          return DsMenuBarItem(
            icon: item.icon,
            title: item.name(translate),
            onTap: () {
              NavigatorService.instance.pushReplacement(item.url);
            },
          );
        },
      ),
      appBar: DsAppBar(
        actions: [
          ThemeButtonComponent(themeStore: themeStore),
        ],
        title: title,
      ),
      body: body,
      floatingActionButton: floatingActionButton,
    );
  }
}
