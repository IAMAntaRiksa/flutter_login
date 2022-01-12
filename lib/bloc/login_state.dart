part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccsess extends LoginState {}

class FailedLogIn extends LoginState {}

class LoginFaildetoHome extends LoginState {}

class LoginError extends LoginState {
  final String message;

  const LoginError({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
