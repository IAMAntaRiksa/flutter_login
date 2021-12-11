import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_flutter/network/api_client_response.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  LoginBloc() : super(LoginInitial()) {
    on<GetLoginEvent>(_getMapLogin);
    // on<GetRegestrasiUserEvent>(_getMapRegistrasi);
  }

  FutureOr<void> _getMapLogin(GetLoginEvent event, emit) async {
    emit(LoginLoding());
    final check = await _apiClientResponse.sendLogin(
        username: event.username, password: event.password);
    try {
      emit(LoginSuccsess(token: check.toString()));
    } catch (e) {
      emit(const LoginError(message: 'Error Data Login'));
    }
  }

//   FutureOr<void> _getMapRegistrasi(GetRegestrasiUserEvent event, emit) async {
//     emit(LoginLoding());
//       final check = await _apiClientResponse.registrasiUser(
//         username: event.username,
//         password: event.password,
//         confirmPass: event.confrimPassword,
//         email: event.email);
//     try {
//       if(check != null){
//         emit
//       }
//     } catch (e) {
//       emit(RegisterError(message: e.toString()));
//     }
//   }
// }
}
