import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:remote_jukebox_32/presentation/theme/app_theme.dart';
import 'package:remote_jukebox_32/widgets/song_widget.dart';

import '../../application/music_list_provider.dart';
import '../../domain/entities/music.dart';
import '../theme/app_color.dart';
class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final musicListProvider = Provider.of<MusicListProvider>(context, listen: false);
    musicListProvider.fetchLibrary();
  }

  @override
  Widget build(BuildContext context) {
    final musicListProvider = context.watch<MusicListProvider>();

    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Bruno twix...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF11377b)),
              ),
              onChanged: (value) {
                musicListProvider.filterSongs(value);
              },
            ),
          ),
          Expanded(
            child: musicListProvider.library.isNotEmpty
                ? ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              itemCount: musicListProvider.library.length,
              itemBuilder: (context, index) {
                final Music music = musicListProvider.library[index];
                return GestureDetector(
                    onTap: () {
                      // Show image in full-screen dialog
                      showQrCode(context, music);
                    },
                    child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0), // Space between rows
                        child: SongWidget(music: music),
                    )
                );
              },
            )
                : const Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }

  void showQrCode(BuildContext context, Music music) {
    // Manage the dialog
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => Dialog(
        backgroundColor: Colors.black.withOpacity(0.75),
        shape: const BeveledRectangleBorder(),
        insetPadding: EdgeInsets.zero,
        // Manage the onclick remove this
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 0.15,
                  child: Image.network(
                    music.imageUrl ?? '',
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        AppTheme.musicCoverMissing,
                        fit: BoxFit.contain,
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                QrImageView(
                  data: getQrCodeContent(music),
                  version: QrVersions.auto,
                  size: MediaQuery.of(context).size.height * 0.30,
                  backgroundColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /**
   * Return the music name formated like ArtistNameSongName
   */
  String getQrCodeContent(Music music) {
    String fullTitle = "${music.artist} ${music.title}";
    return fullTitle.toLowerCase().split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1);
    }).join('');
  }
}
