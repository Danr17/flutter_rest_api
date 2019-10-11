import 'package:flutter/foundation.dart';

class CurrentTab with ChangeNotifier {

  int _currentTab = 0;
  get currentTab => this._currentTab;
  set currentTab(int value) {
    this._currentTab = value;
    notifyListeners();
  }

}