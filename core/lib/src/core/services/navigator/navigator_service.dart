import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

class NavigatorService {
  static final instance = NavigatorService._();

  final GlobalKey<NavigatorState> navigatorKey;

  NavigatorService._() : navigatorKey = GlobalKey<NavigatorState>() {
    Modular.to.addListener(() {
      log('Navigated to: ${Modular.to.path}');
    });
  }

  NavigatorState get _state => navigatorKey.currentState!;

  Future<void> push(String name, {Map<String, dynamic>? args}) async {
    await _state.pushNamed(name, arguments: args);
  }

  Future<void> pushReplacement(String name) async {
    await _state.pushReplacementNamed(name);
  }

  Future<void> pop() async {
    _state.pop();
  }
}
