import 'package:flutter/material.dart';

class AddDataPageProvider extends ChangeNotifier{
   String? data='';
  String? ValidationCheck(String? value){
    if (value == null || value.isEmpty) {
      data= 'Enter Field';
      notifyListeners();
    }
    return null;
  }

  String? addData(String? val){
    data=val;
    notifyListeners();
  }
}