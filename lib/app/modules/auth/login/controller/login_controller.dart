import 'package:get/get.dart';

class LoginController extends GetxController{
bool isLogin=true;
  setIsLogin(bool newVal){
    isLogin=newVal;
    update();
  }
}