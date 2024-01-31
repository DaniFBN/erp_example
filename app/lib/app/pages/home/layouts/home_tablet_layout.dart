import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'widgets/logout_button_widget.dart';
import 'widgets/theme_button_widget.dart';
import 'widgets/user_image_widget.dart';

class HomeTabletLayout extends StatelessWidget {
  const HomeTabletLayout({super.key});

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
          LogoutButtonWidget(onTap: () {}),
        ],
        title: 'Home',
      ),
    );
  }
}
