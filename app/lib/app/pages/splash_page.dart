import 'package:core/core.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  final UserStore userStore;

  const SplashPage({
    super.key,
    required this.userStore,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    await Future.wait([
      widget.userStore.loadUser(),
      Future.delayed(const Duration(seconds: 5)),
    ]);

    if (widget.userStore.isAuthenticated) {
      NavigatorService.instance.pushReplacement('/home');
    } else {
      NavigatorService.instance.pushReplacement('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          'Carregando',
          style: theme.textTheme.displayLarge,
        ),
      ),
    );
  }
}
