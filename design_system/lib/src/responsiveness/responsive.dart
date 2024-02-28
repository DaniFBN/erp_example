import 'package:flutter/material.dart';

class Responsive {
  static const _desktopSize = Size(1480, 1024);
  static const _tabletSize = Size(800, 1000);
  static const _mobileSize = Size(370, 800);
  static Size? _size;

  static void setSize(Size size) {
    _size = size;
  }

  static bool isMobile() => _size!.width < 550;
  static bool isTablet() => !isMobile() && _size!.width < 1200;
  static bool isDesktop() => !isMobile() && !isTablet();

  static double _getFactor() {
    if (isDesktop()) {
      final factor = _size!.height / _desktopSize.height;
      return factor;
    }

    return 1;
  }

  static double size(double value) {
    final factor = _getFactor();

    return value * factor;
  }
}
