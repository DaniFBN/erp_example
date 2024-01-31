import 'package:auth_module/auth_module.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    Responsive.setSize(size);

    return MaterialApp(
      title: 'ERP',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.light,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const HomePage(),
      },
    );
  }
}
