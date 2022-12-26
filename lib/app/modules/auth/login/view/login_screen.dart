import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kodra/app/modules/auth/login/controller/login_controller.dart';
class LoginScreenView extends GetView<LoginController> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool isLogin = true;
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();

  LoginScreenView({Key? key}) : super(key: key);
   @override
  var controller=Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
       body: Container(),
      ),
    );
  }
}
