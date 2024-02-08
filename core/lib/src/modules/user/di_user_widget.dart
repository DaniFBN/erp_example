import 'package:flutter/widgets.dart';
import 'package:global_dependencies/global_dependencies.dart';

import 'data/repositories/user_repository.dart';
import 'domain/repositories/i_user_repository.dart';
import 'domain/stores/user_store.dart';


class DiUserWidget extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const DiUserWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IUserRepository>(
          lazy: true,
          create: (context) => UserRepository(context.read()),
        ),
        Provider(
          lazy: true,
          create: (context) => UserStore(context.read<IUserRepository>()),
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
