import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kodra/app/core/values/localization/ar.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:get/get.dart';
import 'package:kodra/app/shared/app_cached_image.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:kodra/app_constant.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';

class UserView extends StatefulWidget{
   UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController wordController=TextEditingController();
   bool _hasSpeech = false;

   String lastWords = "";

   String lastError = "";

   String lastStatus = "";

   final SpeechToText speech = SpeechToText();

   @override
   void initState() {
     super.initState();
     initSpeechState();
   }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(onError: errorListener, onStatus: statusListener );

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

   @override
  Widget build(BuildContext context) {
    double width = Get.width;
    double height = Get.height;
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'المستخدم',
          fontSize: 22,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: kBackgroundColor,
        actions: [
          IconButton(
              onPressed: () {
                Get.off(()=>const HomeView());
              },
              icon: const Icon(
                Icons.home,
                color: kPurpleColor,
                size: 35,
              ))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                child:const AppCashedImage(
                  imageUrl:
                      'https://tse1.mm.bing.net/th?id=OIP.dDHcQ1SdEMWt89-69_pH8AHaEx&pid=Api&P=0',
                  fit: BoxFit.contain,
                ),
              )),
          Expanded(
              child: Container(
                color: Colors.grey,
                child: Row(
                  children: [
                    IconButton(onPressed:startListening
                    , icon: const Icon(Icons.keyboard_voice,size: 35,color: kPurpleColor,)),
                    Expanded(
                      child: CustomTextFormField(
                        backgroundColor: Colors.grey,
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        keyboardType: TextInputType.text,
                        controller: wordController,
                        text: 'اكتب هنا',
                        validateEmptyText: 'empty'.tr,
                        radius: 7,
                        hintText: 'اكتب هنا',
                      ),
                    ),
                       const Icon(Icons.perm_identity,size: 35,color:Colors.black,),

                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: kBackgroundDarkColor,
              child:  Center(
                  child: Text(lastWords),
                ),
              )),
        ],
      ),
    );
  }



  void startListening() async{
    lastWords = "";
    lastError = "";
    // var locales = await speech.locales();
    // var selectedLocale = locales[LocaleName.];
    speech.listen(onResult: resultListener,localeId:'ar');
    setState(() {

    });
  }

  void stopListening() {
    speech.stop( );
    setState(() {

    });
  }

  void cancelListening() {
    speech.cancel( );
    setState(() {

    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void errorListener(SpeechRecognitionError error ) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }
  void statusListener(String status ) {
    setState(() {
      lastStatus = "$status";
    });
  }
}
