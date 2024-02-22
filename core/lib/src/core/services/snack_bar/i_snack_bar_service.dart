import 'package:flutter/material.dart';

abstract class ISnackBarService {
  GlobalKey<ScaffoldMessengerState>? get key;
  Future<void> showSnackBar(SnackBar snackBar);
  Future<void> showSnackBarByText(String label);
  void dispose();
}
