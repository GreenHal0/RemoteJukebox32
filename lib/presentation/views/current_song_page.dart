import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CurrentSongPage extends StatefulWidget {
  const CurrentSongPage({super.key});

  @override
  State<CurrentSongPage> createState() => _CurrentSongPageState();
}

class _CurrentSongPageState extends State<CurrentSongPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //final cardNotifier = Provider.of<CollectionPageNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    //final cardNotifier = context.watch<CollectionPageNotifier>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("COLLECTION"),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              showSortOptions(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search player...",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF11377b)),
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  void showSortOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.sort_by_alpha),
              title: const Text("Sort by Name"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
