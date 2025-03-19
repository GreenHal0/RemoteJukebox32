import 'package:flutter/material.dart';

class MusicListProvider extends ChangeNotifier {
  String _message = "Hello from Provider";

  String get message => _message;

  void updateMessage(String newMessage) {
    _message = newMessage;
    notifyListeners();
  }
}