import 'package:flutter/widgets.dart';

class SignUp_Provider extends ChangeNotifier{
  int? isCheck;
  bool isTrue = true;
  int val = 0;

  void obscure(){
    isTrue = !isTrue;
    notifyListeners();
  }

  void check(){
    if(val == 0){
      val = 1;
    }else{
      val = 0;
    }
    notifyListeners();
  }

  void toggle(int index){
    isCheck = index;
    notifyListeners();
  }
}