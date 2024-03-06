import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/logout_button_component.dart';
import 'components/user_image_component.dart';

class HomeTabletLayout extends StatelessWidget {
  final UserStore userStore;
  final ThemeStore themeStore;

  const HomeTabletLayout({
    super.key,
    required this.userStore,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      drawer: DsMenuBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Daniel Fernandes'),
            Text('daniel.noronha@fteam.dev', style: theme.textTheme.bodyLarge),
            const Divider(),
          ],
        ),
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
          const UserImageComponent(),
          const SizedBox(height: 8),
          ThemeButtonComponent(themeStore: themeStore),
          const SizedBox(height: 8),
          LogoutButtonComponent(userStore: userStore),
        ],
        // TODO(danifbn): Intl
        title: 'Home',
      ),
    );
  }
}
