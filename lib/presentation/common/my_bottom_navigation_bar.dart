import 'package:flutter/material.dart';
import 'package:remote_jukebox_32/presentation/theme/app_color.dart';
import 'package:remote_jukebox_32/presentation/theme/app_theme.dart';

class MyBottomNavigationBar extends StatefulWidget {

  // Attributes
  final Function(int) onItemSelected;
  static int currentIndex = 0;

  // Private constructor
  const MyBottomNavigationBar({super.key, required this.onItemSelected});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();

  static int getCurrentIndex() {
    return currentIndex;
  }

  static void setCurrentIndex(int newIndex) {
    currentIndex = newIndex;
  }
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  final List<Map<String, String>> _navOptions = [
    {"title": "Current Song", "icon": AppTheme.currentSongPageIcon},
    {"title": "Library", "icon": AppTheme.libraryPageIcon},
    {"title": "Upload", "icon": AppTheme.uploadPageIcon},
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: MyBottomNavigationBar.currentIndex,
      onTap: (index) {
        setState(() {
          MyBottomNavigationBar.setCurrentIndex(index);
        });
        widget.onItemSelected(index);
      },
      items: _navOptions.asMap().entries.map((entry) {
        final index = entry.key;
        final option = entry.value;
        final isSelected = index == MyBottomNavigationBar.currentIndex;

        return BottomNavigationBarItem(
          icon: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: isSelected ? Colors.yellow : Colors.transparent,
              borderRadius: BorderRadius.circular(32),
            ),
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Image.asset(
              option["icon"]!,
              width: 24,
              height: 24,
              color: isSelected ? Colors.black : Colors.white,
            ),
          ),
          label: option["title"],
        );
      }).toList(),
      backgroundColor: AppColor.mainBlack,
      selectedItemColor: AppColor.mainWhite,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed,
    );
  }
}