import 'package:flutter/material.dart';

import 'i_snack_bar_service.dart';

class ScaffoldMessengerSnackBarService implements ISnackBarService {
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey;

  ScaffoldMessengerSnackBarService()
      : scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  ScaffoldMessengerState get _state => scaffoldMessengerKey.currentState!;

  @override
  GlobalKey<ScaffoldMessengerState>? get key => scaffoldMessengerKey;

  @override
  Future<void> showSnackBar(SnackBar snackBar) async {
    _state.showSnackBar(snackBar);
  }

  @override
  Future<void> showSnackBarByText(String label) async {
    _state.showSnackBar(SnackBar(content: Text(label)));
  }

  @override
  void dispose() {
    _state.clearSnackBars();
    _state.dispose();
  }
}
