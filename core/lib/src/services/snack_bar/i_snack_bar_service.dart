import 'package:flutter/material.dart';

abstract class ISnackBarService {
  Future<void> showSnackBar(SnackBar snackBar);
  Future<void> showSnackBarByText(String label);
  void dispose();
}
