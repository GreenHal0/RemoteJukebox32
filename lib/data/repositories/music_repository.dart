import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:remote_jukebox_32/data/models/music_model.dart';
import 'package:remote_jukebox_32/data/services/firebase_service.dart';

class MusicRepository {
  MusicRepository._();

  static final MusicRepository instance = MusicRepository._();

  static Future<List<MusicModel>> fetchLibrary() async {
    return await FirebaseService.fetchLibrary();
  }
}