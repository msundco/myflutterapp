import 'package:flutter/material.dart';
import 'package:myflutterapp/ViewModel/BaseViewModel.dart';

class ConnectPageViewModel extends BaseViewModel {
  int _counter = 0;

  int get counter => _counter;

  void incrementCounter() {
    _counter++;
    notifyListeners();
  }
}
