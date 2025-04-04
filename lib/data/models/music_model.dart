import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:remote_jukebox_32/domain/entities/music.dart';

part 'music_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MusicModel extends Music {
  final String artist;
  final String title;
  final String? imageUrl;

  MusicModel({
      required this.artist,
      required this.title,
      required this.imageUrl
  }) : super(artist, title, imageUrl);

  // Factory constructor for Cloud Firestore deserialization
  factory MusicModel.fromFirestore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,
      ) {
    final data = snapshot.data();
    return MusicModel(
      artist: data?['artist'],
      title: data?['title'],
      imageUrl: data?['imageUrl'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "artist": artist,
      "title": title,
      if (imageUrl != null) "imageUrl": imageUrl,
    };
  }

  // Factory constructor for JSON deserialization
  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);

  // Method to convert object to JSON
  Map<String, dynamic> toJson() => _$MusicModelToJson(this);
}