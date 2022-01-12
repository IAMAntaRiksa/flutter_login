part of 'pendaftaran_bloc.dart';

abstract class PendaftaranState extends Equatable {
  const PendaftaranState();

  @override
  List<Object> get props => [];
}

class PendaftaranInitial extends PendaftaranState {}

class PendaftaranLoading extends PendaftaranState {}

class PendaftaranSuccess extends PendaftaranState {
  final List<Materi> materi;
  const PendaftaranSuccess({
    required this.materi,
  });
}

class PendaftaranError extends PendaftaranState {
  final String message;
  const PendaftaranError({
    required this.message,
  });
}
