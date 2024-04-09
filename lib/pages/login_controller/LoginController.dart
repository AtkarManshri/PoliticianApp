import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:politician_app/pages/navbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{

  //these controller are storing login data
  TextEditingController susername=TextEditingController();
  TextEditingController semail=TextEditingController();
  TextEditingController spassword=TextEditingController();

  String Loginkey="isLogin";
  bool isLogin=false;

  void onInit()
  {
    super.onInit();
    skipLogin();
  }


  void loginfunc() async
  {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(Loginkey,true);
    Get.to(navbar());
  }

void skipLogin() async
{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isLogin = prefs.getBool(Loginkey)!;
  if(isLogin==true)
    {
      print('HOME');
    }
  else{
    print('login');

  }
}

}