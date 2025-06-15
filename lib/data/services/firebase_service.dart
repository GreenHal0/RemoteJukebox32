import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remote_jukebox_32/data/models/music_model.dart';
import 'package:remote_jukebox_32/domain/entities/music.dart';

class FirebaseService {
  FirebaseService._();

  static final FirebaseService _instance = FirebaseService._();
  static final dbMusic =
    FirebaseFirestore.instance
      .collection("musics")
      .withConverter(
        fromFirestore: MusicModel.fromFirestore,
        toFirestore: (MusicModel music, _) => music.toFirestore(),
      );

  static fetchCurrentSong() {
    return Music.empty();
  }

  static Future<List<MusicModel>> fetchLibrary() async {
    final querySnapshot = await dbMusic.get();
    final List<MusicModel> library = querySnapshot.docs.map((doc) => doc.data()).toList();
    return library;
  }

}