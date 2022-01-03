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
    on<GetLoginEvent>(_getMapLogin);
  }

  FutureOr<void> _getMapLogin(GetLoginEvent event, emit) async {
    emit(LoginLoding());
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final auth = await _apiClientResponse.sendLogin(
          email: event.email, password: event.password);
      String token = prefs.setString('token', auth ?? '').toString();
      prefs.getString('token');
      if (token.isEmpty) {}
    } catch (e) {
      emit(const LoginError(message: 'Error Data Login'));
    }
  }
}
