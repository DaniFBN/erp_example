import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:global_dependencies/global_dependencies.dart';

import '../../core.dart';
import '../modules/user/di_user_widget.dart';
import 'firebase/auth/_auth_service.dart';
import 'snack_bar/scaffold_messenger_snack_bar_service.dart';

class DiServiceWidget extends StatelessWidget {
  final Widget Function(BuildContext) builder;

  const DiServiceWidget({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ISnackBarService>(
          lazy: true,
          dispose: (_, value) => value.dispose(),
          create: (_) => ScaffoldMessengerSnackBarService(),
        ),
        Provider(
          lazy: true,
          create: (_) => FirebaseAuth.instance,
        ),
        Provider<EmailProvider>(
          lazy: true,
          create: (context) => EmailProvider(context.read<FirebaseAuth>()),
        ),
        Provider<IAuthService>(
          lazy: true,
          create: (context) {
            return FirebaseAuthService(context.read<EmailProvider>());
          },
        ),
      ],
      child: DiUserWidget(builder: builder),
    );
  }
}
