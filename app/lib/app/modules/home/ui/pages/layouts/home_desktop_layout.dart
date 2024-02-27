import 'dart:developer';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

import 'components/language_button_component.dart';
import 'components/logout_button_component.dart';
import 'components/theme_button_component.dart';
import 'components/user_image_component.dart';

class HomeDesktopLayout extends StatefulWidget {
  final UserStore userStore;
  final ThemeStore themeStore;
  final IntlStore intlStore;

  const HomeDesktopLayout({
    super.key,
    required this.userStore,
    required this.themeStore,
    required this.intlStore,
  });

  @override
  State<HomeDesktopLayout> createState() => _HomeDesktopLayoutState();
}

class _HomeDesktopLayoutState extends State<HomeDesktopLayout> {
  int? selectedIndex;
  bool get showMenu => selectedIndex != null;

  @override
  Widget build(BuildContext context) {
    final translate = AppLocalizations.of(context);
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
                const UserImageComponent(),
                const SizedBox(height: 8),
                LanguageButtonComponent(intlStore: widget.intlStore),
                const SizedBox(height: 8),
                ThemeButtonComponent(themeStore: widget.themeStore),
                const SizedBox(height: 8),
                LogoutButtonComponent(userStore: widget.userStore),
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
                // TODO(danifbn): Intl
                title: Text('User $selectedIndex'),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return DsMenuBarItem(
                    icon: Icons.add,
                    // TODO(danifbn): Intl
                    title: 'Cadastrar $index',
                    onTap: () {},
                  );
                },
              ),
            ),
          ),
          ScopedBuilder(
            store: widget.userStore,
            onState: (_, state) => Text(translate.emailInvalid),
            onLoading: (_) => const CircularProgressIndicator(),
            onError: (_, error) => Text(error.toString()),
          ),
        ],
      ),
    );
  }
}
