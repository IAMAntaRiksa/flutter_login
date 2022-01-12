import 'package:json_annotation/json_annotation.dart';

part 'pendaftaran.g.dart';

@JsonSerializable()
class Pendaftaran {
  @JsonKey(name: 'materi')
  final Materi materi;
  Pendaftaran({
    required this.materi,
  });

  factory Pendaftaran.fromJson(Map<String, dynamic> json) =>
      _$PendaftaranFromJson(json);
}

@JsonSerializable()
class Materi {
  @JsonKey(name: 'judul')
  final String judul;
  @JsonKey(name: 'deskripsi')
  final String deskripsi;
  Materi({
    required this.judul,
    required this.deskripsi,
  });

  factory Materi.fromJson(Map<String, dynamic> json) => _$MateriFromJson(json);
}
