import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_flutter/data/model/pendaftaran.dart';
import 'package:login_flutter/data/respository/api_client_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pendaftaran_event.dart';
part 'pendaftaran_state.dart';

class PendaftaranBloc extends Bloc<PendaftaranEvent, PendaftaranState> {
  ApiClientResponse api = ApiClientResponse();
  PendaftaranBloc() : super(PendaftaranInitial()) {
    on<FetchPendaftaran>(onFetchPendaftaran);
  }

  FutureOr<void> onFetchPendaftaran(
      FetchPendaftaran event, Emitter<PendaftaranState> emit) async {
    emit(PendaftaranLoading());
    SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      List<Materi>? pendafarn = await api.pendaftaranMateri();
      if (preferences.getString('access') != null) {
        emit(PendaftaranSuccess(materi: pendafarn ?? []));
      }
    } catch (e) {
      emit(const PendaftaranError(message: 'Gagal Ambil data'));
    }
  }
}
