import 'package:flutter/material.dart';

class UserCache extends ChangeNotifier {
  static final UserCache _instance = UserCache._internal();
  factory UserCache() => _instance;
  UserCache._internal();

  String? _username;
  String? get username => _username;

  void setUsername(String name) {
    _username = name;
    notifyListeners();
  }
}
