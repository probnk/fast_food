import 'package:flutter/foundation.dart';

class HomePage_Provider extends ChangeNotifier{
  int selected = 0;

  void update(int val){
    selected = val;
    notifyListeners();
  }
}