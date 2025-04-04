// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'music_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusicModel _$MusicModelFromJson(Map<String, dynamic> json) => MusicModel(
      artist: json['artist'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$MusicModelToJson(MusicModel instance) =>
    <String, dynamic>{
      'artist': instance.artist,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
    };
