library core;

import 'package:firebase_auth/firebase_auth.dart';

import 'src/services/firebase/auth/_auth_service.dart';

export 'src/exceptions/app_exception.dart';
export 'src/services/_services.dart';

final firebaseAuth = FirebaseAuthService(EmailProvider(FirebaseAuth.instance));
