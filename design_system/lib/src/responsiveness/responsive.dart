import 'package:flutter/material.dart';

class Responsive {
  static Size? _size;

  static void setSize(Size size) {
    _size = size;
  }

  static bool isMobile() => _size!.width < 500;
  static bool isTablet() => !isMobile() && _size!.width < 1200;
  static bool isDesktop() => !isMobile() && !isTablet();
}
