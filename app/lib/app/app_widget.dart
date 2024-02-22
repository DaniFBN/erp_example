import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';
import 'package:l10n/l10n.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Responsive.setSize(size);

    Modular.setNavigatorKey(NavigatorService.instance.navigatorKey);

    final intlStore = Modular.get<IntlStore>();
    final themeStore = Modular.get<ThemeStore>();
    final snackBarService = Modular.get<ISnackBarService>();

    return AnimatedBuilder(
      animation: Listenable.merge([intlStore, themeStore]),
      builder: (context, _) {
        final locale = intlStore.value;

        return MaterialApp.router(
          title: 'ERP',
          scaffoldMessengerKey: snackBarService.key,

          // Modular
          routerConfig: Modular.routerConfig,

          // Theme
          themeMode: themeStore.isLight ? ThemeMode.light : ThemeMode.dark,
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,

          // Intl
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          locale: locale,
        );
      },
    );
  }
}
