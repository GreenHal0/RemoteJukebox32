class Music {
  final String artist;
  final String title;
  final String? imageUrl;

  Music(this.artist, this.title, [this.imageUrl]);

  Music.empty()
    : artist = "",
      title = "",
      imageUrl = null;
}