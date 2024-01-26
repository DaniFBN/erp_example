import 'package:flutter/material.dart';

import 'responsive.dart';

class DsLayoutResolver extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const DsLayoutResolver({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    MediaQuery.sizeOf(context);

    if (Responsive.isMobile()) return mobile;
    if (Responsive.isTablet()) return tablet;
    return desktop;
  }
}
