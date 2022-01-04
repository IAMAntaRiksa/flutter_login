part of 'login_bloc.dart';

class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class CsloginEvent extends LoginEvent {
  final String email;
  final String password;

  const CsloginEvent({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}

class LogOutEvent extends LoginEvent {}

class CheckLoginEvent extends LoginEvent {}
