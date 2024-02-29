import 'package:core/core.dart';
import 'package:flutter/material.dart';

import '../../../../../core/shared/components/mobile_template_component.dart';

class HomeMobileLayout extends StatelessWidget {
  final ThemeStore themeStore;

  const HomeMobileLayout({
    super.key,
    required this.themeStore,
  });

  @override
  Widget build(BuildContext context) {
    return MobileTemplateComponent(
      themeStore: themeStore,
      // TODO(danifbn): Intl
      title: 'Home',
      body: Container(),
    );
  }
}
