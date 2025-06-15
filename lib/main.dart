import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/services/user_preferences.dart';
import 'application/music_provider.dart';
import 'presentation/views/main_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  UserPreferences.initSharedPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MusicProvider(), // Only one provider
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MainScreen(),
        ),
    );
  }
}