part of 'login_bloc.dart';

class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoding extends LoginState {}

class LoginSuccsess extends LoginState {
  // final User user;
  // const LoginSuccsess({
  //   required this.user,
  // });
}

class LoginError {
  final String message;

  const LoginError({
    required this.message,
  });

  List<Object> get props => [message];
}
