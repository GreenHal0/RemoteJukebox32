import 'package:flutter/material.dart';
import 'package:remote_jukebox_32/data/repositories/music_repository.dart';
import 'package:remote_jukebox_32/domain/entities/music.dart';

import '../data/models/music_model.dart';

class MusicProvider extends ChangeNotifier {
  Music _currentSong = Music.empty();
  List<MusicModel> _library = [];
  List<MusicModel> _filteredSongs = [];

  Music get currentSong => _currentSong;
  List<MusicModel> get library => _library;
  List<MusicModel> get filteredSongs => _filteredSongs;

  Future<void> fetchCurrentSong() async {
    _currentSong = await MusicRepository.fetchCurrentSong();
    notifyListeners();
  }

  Future<void> fetchLibrary() async {
    _library = await MusicRepository.fetchLibrary();
    //fakeLibrary();
    notifyListeners();
  }

  void filterSongs(String filter) {
    //TODO("Filter the songs by name or artist and return both in _filteredSongs")
    notifyListeners();
  }

  void volumeDown() {}

  void volumeUp() {}

  void skipPrevious() {}

  void skipNext() {}

  void pauseMusic() {}

  void resumeMusic() {}

  void fakeLibrary() {
    library.add(MusicModel(artist: "artist 0", title: "title 0", imageUrl: null));
    library.add(MusicModel(artist: "artist 1", title: "title 1", imageUrl: null));
    library.add(MusicModel(artist: "artist 2", title: "title 2", imageUrl: null));
    library.add(MusicModel(artist: "artist 3", title: "title 3", imageUrl: null));
    library.add(MusicModel(artist: "artist 4", title: "title 4", imageUrl: null));
    library.add(MusicModel(artist: "artist 5", title: "title 5", imageUrl: null));
    library.add(MusicModel(artist: "artist 6", title: "title 6", imageUrl: null));
    library.add(MusicModel(artist: "artist 7", title: "title 7", imageUrl: null));
    library.add(MusicModel(artist: "artist 8", title: "title 8", imageUrl: null));
    library.add(MusicModel(artist: "artist 9", title: "title 9", imageUrl: null));
    notifyListeners();
  }

}
