import 'package:kodra/app/shared/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterWidget extends StatelessWidget {
  var nameController, emailController, passwordController;

  RegisterWidget(
      {Key? key, required this.nameController,
      required this.passwordController,
      required this.emailController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          hintText: 'name'.tr,
          keyboardType: TextInputType.text,
          prefixIcon: Icons.perm_identity,
          radius: 8,
          horizontalPadding: 12,
          validateEmptyText: 'empty'.tr,
          controller: nameController,
        ),
        CustomTextFormField(
          hintText: 'email'.tr,
          validateEmptyText: 'empty'.tr,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email,
          radius: 8,
          horizontalPadding: 12,
          controller: emailController,
        ),
        CustomTextFormField(
          isPassword: true,
          hintText: 'password'.tr,
          prefixIcon: Icons.lock,
          validateEmptyText: 'empty'.tr,
          keyboardType: TextInputType.visiblePassword,
          radius: 8,
          horizontalPadding: 12,
          controller: passwordController,
        ),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
        //   child: RichText(
        //     text: TextSpan(children: [
        //       TextSpan(
        //           text: 'by_pressing_on'.tr,
        //           style: const TextStyle(color: Colors.white)),
        //       TextSpan(
        //           text: 'terms'.tr,
        //           style: const TextStyle(
        //             color: Colors.white,
        //             fontWeight: FontWeight.bold,
        //             decoration: TextDecoration.underline,
        //             decorationColor: Colors.white,
        //             decorationThickness: 1,
        //             fontSize: 16,
        //           ),
        //           recognizer: TapGestureRecognizer()..onTap = () {}),
        //     ]),
        //   ),
        // ),
      ],
    );
  }
}
