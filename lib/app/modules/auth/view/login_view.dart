import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/data/models/login_model.dart';
import 'package:kodra/app/data/remote_data_source/auth_apis.dart';
import 'package:kodra/app/modules/auth/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:kodra/app/modules/auth/view/register_view.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:kodra/app/shared/snack_bar.dart';
import 'package:kodra/app_constant.dart';

class LoginView extends GetView<AuthController> {
  final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
  @override
 final AuthController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundDarkColor,
          title:  AppText(
            'login'.tr,
            fontSize: 22,
            color: Colors.black,
          ),
          centerTitle: true,
          actions: [
            // IconButton(
            //     onPressed: () {
            //       Get.off(() => const HomeView());
            //     },
            //     icon: const Icon(
            //       Icons.settings,
            //       color: Colors.black,
            //       size: 35,
            //     ))
          ],
        ),
        body: GetBuilder<AuthController>(
          builder: (context) {
            return Container(
              color: kBackgroundDarkColor,
              height: Get.height,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 20,),
                      Card(
                        elevation: 20,
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),

                        ),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration:  const BoxDecoration(
                            gradient:LinearGradient(
                                colors: [
                                  kPurpleColor,
                                  kUnSelectedColor
                                ]
                            ),

                          ),
                          child:
                          Image.asset(
                            'assets/images/free_icon.png',
                            width: 160,
                            height: 160,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 25,),

                      CustomTextFormField(
                        hintText: 'email_hint'.tr,
                        controller: controller.emailController,
                        keyboardType: TextInputType.text,
                        validateEmptyText: 'empty'.tr,
                        prefixIcon: Icons.email_outlined,
                        radius: 15,
                      ),
                      CustomTextFormField(
                        hintText: 'code_hint'.tr,
                        controller: controller.codeController,
                        keyboardType: TextInputType.text,
                        validateEmptyText: 'empty'.tr,
                        prefixIcon: Icons.lock,
                        radius: 15,
                      ),
                      const SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Expanded(child:  AppProgressButton(onPressed: (AnimationController animationController)async{
                              if(_formKey.currentState!.validate()) {
                                animationController.forward();
                                await Future.delayed(const Duration(seconds: 2)).then((value) async{
                                  LoginModel model = await AuthApis().loginUser(
                                      email: controller.emailController.text,
                                      password: controller.codeController.text);
                                  if (model.expiresIn != null) {
                                    Get.offAll(() => HomeView());
                                    showSnackBar('login_success'.tr);
                                    animationController.reverse();
                                  } else if (model.error?.message != null) {
                                    showSnackBar(
                                        model.error?.message ?? 'general_error'.tr);
                                    animationController.reverse();
                                  }
                                });
                              }
                            },
                              backgroundColor: Colors.white,textColor: Colors.black,
                              text: 'login'.tr,
                              radius: 20,)),
                            const SizedBox(width: 15,),
                            Expanded(child:  AppProgressButton(onPressed: (AnimationController animationController){


                              Get.off(()=>RegisterView(),binding: GetBinding());
                            },
                              backgroundColor: Colors.white,textColor: Colors.black,
                              text: 'register'.tr,
                              radius: 20,))
                          ],
                        ),
                      ),
                      const SizedBox(height: 20,),
                     AppText('forget_password'.tr,color:Colors.blueAccent,fontSize: 20,)

                    ],
                  ),
                ),
              ),
            );
          }
        ));
  }
}
