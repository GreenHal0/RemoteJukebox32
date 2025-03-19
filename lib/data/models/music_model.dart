import 'package:json_annotation/json_annotation.dart';

part 'music_model.g.dart';

@JsonSerializable(explicitToJson: true)
class MusicModel {
  final String artist;
  final String title;
  final String image;

  MusicModel(this.artist, this.title, this.image);

  // Factory constructor for JSON deserialization
  factory MusicModel.fromJson(Map<String, dynamic> json) =>
      _$MusicModelFromJson(json);

  // Method to convert object to JSON
  Map<String, dynamic> toJson() => _$MusicModelToJson(this);
}