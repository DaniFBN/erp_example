import 'dart:developer';

import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'widgets/logout_button_widget.dart';
import 'widgets/theme_button_widget.dart';
import 'widgets/user_image_widget.dart';

class HomeDesktopLayout extends StatefulWidget {
  const HomeDesktopLayout({super.key});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  int? selectedIndex;
  bool get showMenu => selectedIndex != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DsSideBar(
            width: 64,
            onThemeTap: () => log('theme'),
            onLogoutTap: () => log('logout'),
            itemCount: 5,
            itemBuilder: (_, index) {
              return DsSideBarItem(
                isSelected: selectedIndex == index,
                icon: Icons.add,
                onTap: () {
                  setState(() {
                    if (selectedIndex == index) {
                      selectedIndex = null;
                    } else {
                      selectedIndex = index;
                    }
                  });
                },
              );
            },
            trailing: Column(
              children: [
                const UserImageWidget(),
                const SizedBox(height: 8),
                ThemeButtonWidget(onTap: () {}),
                const SizedBox(height: 8),
                LogoutButtonWidget(onTap: () {}),
              ],
            ),
          ),
          ClipRect(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 300),
              widthFactor: showMenu ? 1 : 0,
              alignment: Alignment.center,
              child: DsMenuBar(
                width: Responsive.size(260),
                title: Text('User $selectedIndex'),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return DsMenuBarItem(
                    icon: Icons.add,
                    title: 'Cadastrar $index',
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
