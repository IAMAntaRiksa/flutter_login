part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetLoginEvent extends LoginEvent {
  final String username;
  final String password;

  const GetLoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [username, password];
}

class GetRegestrasiUserEvent extends LoginEvent {
  final String username;
  final String password;
  final String confrimPassword;
  final String email;

  const GetRegestrasiUserEvent({
    required this.username,
    required this.password,
    required this.confrimPassword,
    required this.email,
  });
}
