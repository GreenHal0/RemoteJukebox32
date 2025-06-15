import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_jukebox_32/presentation/theme/app_color.dart';
import 'package:remote_jukebox_32/presentation/theme/app_theme.dart';

import '../../application/music_provider.dart';

class CurrentSongPage extends StatefulWidget {
  const CurrentSongPage({super.key});

  @override
  State<CurrentSongPage> createState() => _CurrentSongPageState();
}

class _CurrentSongPageState extends State<CurrentSongPage> {

  bool isSongPlaying = false;

  @override
  void initState() {
    super.initState();
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    // musicProvider.fetchCurrentSong();
  }

  @override
  Widget build(BuildContext context) {
    final musicProvider = context.watch<MusicProvider>();

    return Scaffold(
      backgroundColor: AppColor.mainGrey,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // PART WITH THE CURRENT TRACK TEXT INFOS

            Text(
              "Artist :",
              style: TextStyle(color: AppColor.mainBlack, fontSize: 48),
            ),
            Text(
                musicProvider.currentSong.artist,
              style: TextStyle(color: AppColor.mainYellow, fontSize: 36),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 24,
            ),
            Text(
              "Track :",
              style: TextStyle(color: AppColor.mainBlack, fontSize: 48),
            ),
            Text(
              musicProvider.currentSong.title,
              style: TextStyle(color: AppColor.mainYellow, fontSize: 36),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 64,
            ),

            // PART WITH THE IMAGE AND THE VOLUME MANAGEMENT
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    musicProvider.volumeDown();
                  },
                  child: Image.asset(
                    AppTheme.volumeDownIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
                Image.asset(
                  musicProvider.currentSong.imageUrl ?? AppTheme.appLogo,
                  width: 160,
                  height: 160,
                ),
                GestureDetector(
                  onTap: () {
                    musicProvider.volumeUp();
                  },
                  child: Image.asset(
                    AppTheme.volumeUpIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 48,
            ),

            // PART WITH THE PREVIOUS/PAUSE/RESUME/SKIP BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    musicProvider.skipPrevious();
                  },
                  child: Image.asset(
                    AppTheme.skipPreviousIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      isSongPlaying ? musicProvider.pauseMusic() : musicProvider.resumeMusic();
                      isSongPlaying = !isSongPlaying;
                    },
                  child: Image.asset(
                    isSongPlaying ? AppTheme.pauseMusicIcon : AppTheme.resumeMusicIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    musicProvider.skipNext();
                  },
                  child: Image.asset(
                    AppTheme.skipNextIcon,
                    width: 64,
                    height: 64,
                  ),
                ),
              ]
            )
          ],
        ),
      ),
    );
  }
}