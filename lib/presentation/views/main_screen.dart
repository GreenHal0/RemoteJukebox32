import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:remote_jukebox_32/presentation/views/library_page.dart';
import 'package:remote_jukebox_32/presentation/views/upload_page.dart';

import '../common/my_bottom_navigation_bar.dart';
import 'current_song_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  MyBottomNavigationBar? bottomNavigationBar;

  // List of screens that will be kept alive
  final List<Widget> _pages = [
    const CurrentSongPage(),
    const LibraryPage(),
    const UploadPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: bottomNavigationBar = MyBottomNavigationBar(onItemSelected: _onItemTapped)
    );
  }
}
