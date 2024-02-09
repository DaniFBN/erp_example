import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:global_dependencies/global_dependencies.dart';

import 'app/app_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await FirebaseService.initialize();
  Provider.debugCheckInvalidValueType = null;

  runApp(const AppWidget());
}
