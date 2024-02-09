import 'package:auth_module/auth_module.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

import 'pages/home/home_page.dart';
import 'pages/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Responsive.setSize(size);

    return DiServiceWidget(
      builder: (context) {
        return ValueListenableBuilder(
          valueListenable: context.read<IntlStore>(),
          builder: (context, locale, _) {
            return MaterialApp(
              title: 'ERP',
              scaffoldMessengerKey: context.read<ISnackBarService>().key,
              navigatorKey: NavigatorService.instance.navigatorKey,

              // Theme
              themeMode: ThemeMode.light,
              theme: AppTheme.light,
              darkTheme: AppTheme.dark,

              // Intl
              supportedLocales: AppLocalizations.supportedLocales,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              locale: locale,

              // Route
              initialRoute: '/',
              routes: {
                ...AuthRoutes.routes,
                '/': (context) => SplashPage(userStore: context.read()),
                '/home': (context) => HomePage(userStore: context.read()),
              },
            );
          },
        );
      },
    );
  }
}
