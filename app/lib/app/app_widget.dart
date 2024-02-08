import 'package:auth_module/auth_module.dart';
import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Responsive.setSize(size);

    return DiServiceWidget(
      builder: (context) {
        return MaterialApp(
          title: 'ERP',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.light,
          initialRoute: '/login',
          scaffoldMessengerKey: context.read<ISnackBarService>().key,
          navigatorKey: NavigatorService.instance.navigatorKey,
          routes: {
            ...AuthRoutes.routes,
            '/': (context) => HomePage(userStore: context.read()),
          },
        );
      },
    );
  }
}
