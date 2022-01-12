import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_flutter/data/respository/api_client_response.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();

  LoginBloc() : super(LoginInitial()) {
    on<CsloginEvent>(_getMapLogin);
    on<InitAppCheckLogIng>(onSaveLogin);
  }

  FutureOr<void> _getMapLogin(CsloginEvent event, emit) async {
    emit(LoginLoding());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      final String? token = await _apiClientResponse.sendLogin(
          email: event.email, password: event.password);

      if (token != null) {
        await preferences.setString('access', token);
        emit(LoginSuccsess());
      } else {
        emit(FailedLogIn());
      }
    } catch (e) {
      emit(const LoginError(message: 'Error Data Login'));
    }
  }

  FutureOr<void> onSaveLogin(
      InitAppCheckLogIng event, Emitter<LoginState> emit) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.getString('access') != null) {
      emit(LoginSuccsess());
    } else {
      emit(LoginFaildetoHome());
    }
  }
}
