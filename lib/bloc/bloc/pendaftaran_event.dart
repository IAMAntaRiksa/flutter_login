part of 'pendaftaran_bloc.dart';

abstract class PendaftaranEvent extends Equatable {
  const PendaftaranEvent();

  @override
  List<Object> get props => [];
}

class FetchPendaftaran extends PendaftaranEvent {}
