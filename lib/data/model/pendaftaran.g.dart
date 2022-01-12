// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pendaftaran.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pendaftaran _$PendaftaranFromJson(Map<String, dynamic> json) => Pendaftaran(
      materi: Materi.fromJson(json['materi'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PendaftaranToJson(Pendaftaran instance) =>
    <String, dynamic>{
      'materi': instance.materi,
    };

Materi _$MateriFromJson(Map<String, dynamic> json) => Materi(
      judul: json['judul'] as String,
      deskripsi: json['deskripsi'] as String,
    );

Map<String, dynamic> _$MateriToJson(Materi instance) => <String, dynamic>{
      'judul': instance.judul,
      'deskripsi': instance.deskripsi,
    };
