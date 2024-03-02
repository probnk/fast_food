import 'package:flutter/widgets.dart';

class Login_Provider extends ChangeNotifier{
  int? isCheck;
  bool isTrue = true;

  void obscure(){
    isTrue = !isTrue;
    notifyListeners();
  }

  void toggle(int index){
    isCheck = index;
    notifyListeners();
  }
}