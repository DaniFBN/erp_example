abstract class LoginEvent {
  const LoginEvent();
}

class SubmitLoginEvent extends LoginEvent {
  final String email;
  final String password;

  const SubmitLoginEvent({
    required this.email,
    required this.password,
  });
}
