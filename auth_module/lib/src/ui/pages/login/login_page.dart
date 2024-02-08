import 'dart:async';

import 'package:core/core.dart';
import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../domain/stores/login_store.dart';
import '../../../domain/stores/states/login_state.dart';
import 'layouts/login_desktop_layout.dart';
import 'layouts/login_mobile_layout.dart';
import 'layouts/login_tablet_layout.dart';

class LoginPage extends StatefulWidget {
  final ISnackBarService snackBarService;
  final LoginStore loginStore;
  final UserStore userStore;

  const LoginPage({
    super.key,
    required this.snackBarService,
    required this.loginStore,
    required this.userStore,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final StreamSubscription loginSubscription;

  @override
  void initState() {
    super.initState();

    loginSubscription = widget.loginStore.stream.listen((state) {
      switch (state) {
        case InitialLoginState():
        case LoadingLoginState():
          return;
        case ErrorLoginState():
          widget.snackBarService.showSnackBarByText(state.exception.message);
        case SuccessLoginState():
          widget.userStore.changeUser(state.userID);
          NavigatorService.instance.pushReplacement('/');
      }
    });
  }

  @override
  void dispose() {
    loginSubscription.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DsLayoutResolver(
      mobile: LoginMobileLayout(loginStore: widget.loginStore),
      tablet: LoginTabletLayout(loginStore: widget.loginStore),
      desktop: LoginDesktopLayout(loginStore: widget.loginStore),
    );
  }
}
