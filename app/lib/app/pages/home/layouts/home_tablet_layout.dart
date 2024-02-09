import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/logout_button_widget.dart';
import 'components/theme_button_widget.dart';
import 'components/user_image_widget.dart';

class HomeTabletLayout extends StatelessWidget {
  final UserStore userStore;
  const HomeTabletLayout({super.key, required this.userStore});

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
          const UserImageWidget(),
          const SizedBox(height: 8),
          ThemeButtonWidget(onTap: () {}),
          const SizedBox(height: 8),
          LogoutButtonWidget(userStore: userStore),
        ],
        // TODO(danifbn): Intl
        title: 'Home',
      ),
    );
  }
}
