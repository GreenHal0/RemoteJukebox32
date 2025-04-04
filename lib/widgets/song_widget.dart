import 'package:flutter/material.dart';
import 'package:remote_jukebox_32/presentation/theme/app_color.dart';
import 'package:remote_jukebox_32/presentation/theme/app_theme.dart';

import '../domain/entities/music.dart';

class SongWidget extends StatelessWidget {
  final Music music;
  final double? width;
  final double? height;

  const SongWidget({
    super.key,
    required this.music,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    var finalWidth = width ?? double.infinity;
    var finalHeight = height ?? 75;
    return SizedBox(
      width: finalWidth,
      height: finalHeight,
      child: Row(
        children: [
          SizedBox(
            height: finalHeight,
            width: finalHeight,
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
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  music.artist,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColor.mainYellow, fontSize: finalHeight/3),
                  textAlign: TextAlign.start,
                ),
                Text(
                  music.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: AppColor.mainYellow, fontSize: finalHeight/3),
                  textAlign: TextAlign.start,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}