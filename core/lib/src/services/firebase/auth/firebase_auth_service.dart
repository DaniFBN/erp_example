import 'package:flutter/foundation.dart';

import '_auth_service.dart';

class FirebaseAuthService implements AuthService {
  FirebaseAuthService(this._email)
      : _provider = ValueNotifier(_email);

  final EmailProvider _email;
  final ValueNotifier<AuthProvider> _provider;

  @override
  Future<UserAuthModel> getCurrentUser() async {
    return _provider.value.getCurrentUser();
  }

  @override
  Future<UserAuthModel> login(String email, String password) async {
    _provider.value = _email;

    return _login(email, password);
  }

  @override
  Future<void> logout() async {
    return _provider.value.logout();
  }

  Future<UserAuthModel> _login(String email, String password) async {
    return _provider.value.login(email, password);
  }
}
