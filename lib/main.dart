import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/services/user_preferences.dart';
import 'application/music_list_provider.dart';
import 'presentation/views/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  UserPreferences.initSharedPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  Future<bool> _checkLoginStatus() async {
    return UserPreferences.getPref(UserPreferences.KEY_USER_ID) != null;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MusicListProvider(), // Only one provider
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Simple App',
          theme: ThemeData(primarySwatch: Colors.blue),
          home: const MainScreen(),
        ),
    );
  }
}