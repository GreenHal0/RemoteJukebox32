import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // final musicListProvider = Provider.of<MusicProvider>(context, listen: false);
    // musicListProvider.fetchLibrary();
  }

  @override
  Widget build(BuildContext context) {
    // final musicListProvider = context.watch<MusicProvider>();

    return Scaffold(
      backgroundColor: AppColor.background,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 128),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "The upload function is not available yet. :/",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.mainYellow,
                fontSize: 48,
              ),
            ),
            Text(
              "But stay tuned, it might get out from nowhere !",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.mainBlack,
                fontSize: 48,
              ),
            ),
          ],
        ),
      )
    );
  }
}