import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_auth_model.dart';

abstract class AuthMapper {
  static UserAuthModel firebaseUserToModel(User user) {
    return UserAuthModel(
      id: user.uid,
      email: user.email,
    );
  }
}
