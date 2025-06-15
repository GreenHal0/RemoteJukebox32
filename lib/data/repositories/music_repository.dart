import 'package:remote_jukebox_32/data/models/music_model.dart';
import 'package:remote_jukebox_32/data/services/firebase_service.dart';

class MusicRepository {
  MusicRepository._();

  static final MusicRepository instance = MusicRepository._();

  static fetchCurrentSong() async {
    return await FirebaseService.fetchCurrentSong();
  }

  static Future<List<MusicModel>> fetchLibrary() async {
    return await FirebaseService.fetchLibrary();
  }
}