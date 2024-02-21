import 'package:flutter/material.dart';

enum Themes { light, dark }

class ThemeStore extends ValueNotifier<Themes> {
  ThemeStore() : super(Themes.light);

  bool get isLight => value == Themes.light;

  void toggle() {
    if (isLight) {
      value = Themes.dark;
    } else {
      value = Themes.light;
    }
  }
}
