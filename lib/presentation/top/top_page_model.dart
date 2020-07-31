import 'package:flutter/material.dart';

class TopPageModel extends ChangeNotifier {
  Future init() async {
    notifyListeners();
  }

  int currentIndex = 0;

  void onTabTap(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
