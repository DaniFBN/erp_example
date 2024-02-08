import 'package:flutter/widgets.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../../../data/repositories/auth_repository.dart';
import '../../../domain/repositories/i_auth_repository.dart';
import '../../../domain/stores/login_store.dart';

class DiLoginWidget extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const DiLoginWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthRepository>(
          lazy: true,
          create: (context) => AuthRepository(context.read()),
        ),
        Provider(
          lazy: true,
          create: (context) => LoginStore(context.read<IAuthRepository>()),
        ),
      ],
      child: Builder(
        builder: (context) {
          return builder(context);
        },
      ),
    );
  }
}
