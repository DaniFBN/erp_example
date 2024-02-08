import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'components/theme_button_widget.dart';

class HomeMobileLayout extends StatelessWidget {
  const HomeMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DsMenuBar(
        title: const Text('User'),
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
          ThemeButtonWidget(onTap: () {}),
        ],
        title: 'Home',
      ),
    );
  }
}
