import 'package:flutter/material.dart';

class HomeEditMenuProvider extends ChangeNotifier {
  bool _editMenu = false;

  bool get editMenu => _editMenu;

  set editMenu(bool value) {
    _editMenu = value;
    notifyListeners();
  }
}
