import 'package:flutter/material.dart';

import 'explicit_animation.dart';
import 'implicit_animation.dart';
import 'implicit_with_value_notifier_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Implicit with Stateful'),
            const SizedBox(height: 8),
            const ImplicitAnimation(),
            const SizedBox(height: 32),
            const Text('Implicit with Stateless'),
            const SizedBox(height: 8),
            ImplicitWithValueNotifierAnimation(),
            const SizedBox(height: 32),
            const Text('Explicit'),
            const SizedBox(height: 8),
            const ExplicitAnimation(),
          ],
        ),
      ),
    );
  }
}
