import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initialize();

  runApp(const AppWidget());
}
