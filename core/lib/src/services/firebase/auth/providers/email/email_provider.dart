import 'package:firebase_auth/firebase_auth.dart' hide AuthProvider;

import '../../_auth_service.dart';
import '../../helpers/exceptions/_exceptions.dart';
import '../../helpers/mappers/auth_mapper.dart';

class EmailProvider implements AuthProvider {
  const EmailProvider(this._auth);

  final FirebaseAuth _auth;

  @override
  Future<UserAuthModel> getCurrentUser() async {
    final firebaseUser = _auth.currentUser;

    if (firebaseUser == null) {
      throw LoggedOutException(
        "Wasn't possible get current user, because it's logged out",
      );
    }

    return AuthMapper.firebaseUserToModel(firebaseUser);
  }

  @override
  Future<UserAuthModel> login(String email, String password) async {
    try {
      final credentials = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credentials.user;

      if (user == null) {
        throw AuthException(
          'Credentials received with an empty user',
          code: 'empty-user',
        );
      }

      return AuthMapper.firebaseUserToModel(user);
    } on FirebaseAuthException catch (exception, stackTrace) {
      throw switch (exception.code) {
        'invalid-email' => InvalidEmailException(
            exception.message ?? 'Invalid Email',
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          ),
        'user-disabled' => UserDisabledException(
            exception.message ?? 'User with email $email was disabled',
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          ),
        'wrong-password' => WrongPasswordException(
            exception.message ?? 'Wrong password',
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          ),
        'user-not-found' => UserNotFoundException(
            exception.message ?? 'Not found an user with email $email',
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          ),
        'INVALID_LOGIN_CREDENTIALS' => AuthException(
            'Internal Crashing Failure',
            code: exception.code,
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          ),
        _ => AuthException(
            exception.message ?? 'Authentication Failure',
            code: exception.code,
            innerException: exception,
            innerStacktrace: exception.stackTrace ?? stackTrace,
          )
      };
    }
  }

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }
}
