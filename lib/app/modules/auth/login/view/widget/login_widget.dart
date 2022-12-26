import 'package:kodra/app/modules/auth/forget_password/forget_password_view.dart';
import 'package:kodra/app/modules/auth/login/controller/login_controller.dart';
import 'package:kodra/app/shared/app_dialog.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginWidget extends GetView<LoginController> {
var nameController,emailController,passwordController;
 LoginWidget({required this.emailController,
   required this.passwordController});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'email'.tr,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          radius: 8,
          horizontalPadding: 12,
          validateEmptyText: 'empty'.tr,
          controller: emailController,
        ),
        CustomTextFormField(
          isPassword: true,
          hintText: 'password'.tr,
          prefixIcon: Icons.lock,
          keyboardType: TextInputType.visiblePassword,
          radius: 8,
          horizontalPadding: 12,
          controller: passwordController,
          validateEmptyText: 'empty'.tr,
        )  ,
        InkWell(
          onTap: () {
            showAppDialog(
              context,
              ForgetPasswordView(),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Align(
              alignment: AlignmentDirectional.centerEnd,
              child: AppText(
                'forget_password'.tr,
                fontSize: 12,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
