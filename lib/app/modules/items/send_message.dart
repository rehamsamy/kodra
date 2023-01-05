import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';

class SendMessageView extends StatelessWidget{
final GlobalKey<FormState>  _formKey = GlobalKey<FormState>();
final TextEditingController fromController=TextEditingController();
final TextEditingController toController=TextEditingController();
final TextEditingController subjectController=TextEditingController();
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       elevation: 0,
       title:  AppText(
         'qodra'.tr,
         fontSize: 22,
         color: Colors.black,
       ),
       centerTitle: true,
       backgroundColor: kBackgroundDarkColor,
       leading:IconButton(
           onPressed: () {
             Get.off(() =>  const HomeView());
           },
           icon: const Icon(
             Icons.arrow_back_rounded,
             color: Colors.black,
             size: 35,
           )) ,
       actions: [

       ],
     ),

     body: Container(
       height: Get.height,
         color: kBackgroundDarkColor,
       alignment: AlignmentDirectional.topCenter,
       child: SingleChildScrollView(
         child: Form(
           key: _formKey,
           child: Column(
             children: [
               const SizedBox(height: 20,),
               const SizedBox(height: 20,),
               CustomTextFormField(
                 hintText: 'to_hint'.tr,
                 controller: toController,
                 keyboardType: TextInputType.emailAddress,
                 validateEmptyText: 'empty'.tr,
                 prefixIcon: Icons.email_outlined,
                 radius: 15,
               ),
               CustomTextFormField(
                 hintText: 'from_hint'.tr,
                 controller: fromController,
                 keyboardType: TextInputType.emailAddress,
                 validateEmptyText: 'empty'.tr,
                 prefixIcon: Icons.email_outlined,
                 radius: 15,
               ),

               CustomTextFormField(
                 hintText: 'subject'.tr,
                 controller: subjectController,
                 keyboardType: TextInputType.text,
                 validateEmptyText: 'empty'.tr,
                 prefixIcon: Icons.edit_notifications,
                 radius: 15,
                 maxLines: 5,
               ),
               const SizedBox(height: 20,),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Row(
                   children: [
                     Expanded(child: AppProgressButton(onPressed: (AnimationController animationController){
                     },
                       backgroundColor: Colors.white,textColor: Colors.black,
                       text: 'send'.tr,
                       radius: 20,)),
                     const SizedBox(width: 15,),
                     Expanded(child:  AppProgressButton(onPressed: (AnimationController animationController)async{
                     Get.off(()=>HomeView());
                     },
                       backgroundColor: Colors.white,textColor: Colors.black,
                       text: 'cancel'.tr,
                       radius: 20,)),
                   ],
                 ),
               ),
             ],
           ),
         ),
       )
     ),
   );
  }



}