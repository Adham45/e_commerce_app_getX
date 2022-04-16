import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../view/account_view.dart';
import '../../view/cart_view.dart';
import '../../view/home_view.dart';

class ControlViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget currentState = HomeScreen();
  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int selectedValue) {
    _navigatorValue = selectedValue;
    switch (selectedValue){
      case 0:
        currentState = HomeScreen();
        break;
      case 1:
        currentState = CartScreen();
        break;
      case 2:
        currentState = AccountView();
        break;
    }
    update();
  }
}
