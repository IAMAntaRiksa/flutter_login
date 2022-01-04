import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_flutter/data/model/user_model.dart';
import 'package:login_flutter/data/respository/api_client_response.dart';
import 'package:login_flutter/shared/shared_prefrance.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final ApiClientResponse _apiClientResponse = ApiClientResponse();
  LoginBloc() : super(LoginInitial()) {
    on<CsloginEvent>(_getMapLogin);
  }

  FutureOr<void> _getMapLogin(CsloginEvent event, emit) async {
    emit(LoginLoding());
    try {
      final auth = await _apiClientResponse.sendLogin(
          email: event.email, password: event.password);
      await Sharedprefrance().replacToken();

      if (auth?.token.isNotEmpty ?? false) {
        Sharedprefrance().saveToken(auth?.token ?? '');
        emit(LoginSuccsess());
      }
    } catch (e) {
      emit(const LoginError(message: 'Error Data Login'));
    }
  }
}
