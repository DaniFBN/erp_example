import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

class HomeDesktopLayout extends StatefulWidget {
  const HomeDesktopLayout({super.key});

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  bool showMenu = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DsSideBar(
            onThemeTap: () {
              print('theme');
            },
            onLogoutTap: () {
              print('logout');
            },
            onTap: () {
              setState(() {
                showMenu = !showMenu;
              });
            },
          ),
          ClipRect(
            child: AnimatedAlign(
              duration: const Duration(seconds: 5),
              widthFactor: showMenu ? 1 : 0,
              alignment: Alignment.center,
              child: const DsMenuBar(),
            ),
          ),
        ],
      ),
    );
  }
}
