import 'package:flutter/material.dart';
import 'package:kodra/app/data/models/word_model.dart';
import 'package:kodra/app/data/remote_data_source/word_to_image_api.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:get/get.dart';
import 'package:kodra/app/shared/app_cached_image.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/app_text_field.dart';
import 'package:kodra/app_constant.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:progress_indicators/progress_indicators.dart';

class UserView extends StatefulWidget{
   UserView({Key? key}) : super(key: key);

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  TextEditingController wordController = TextEditingController();
  final fb = FirebaseDatabase.instance;
  String ? imageUrl;
  bool _hasSpeech = false;

  String lastWords = "";

  String lastError = "";

  String lastStatus = "";
bool isLoading=false;
  final SpeechToText speech = SpeechToText();

  @override
  void initState() {
    super.initState();
    initSpeechState();
  }

  Future<void> initSpeechState() async {
    bool hasSpeech = await speech.initialize(
        onError: errorListener, onStatus: statusListener);

    if (!mounted) return;
    setState(() {
      _hasSpeech = hasSpeech;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ref = fb.reference();
    return Scaffold(
      appBar: AppBar(
        title: const AppText(
          'المستخدم',
          fontSize: 22,
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {
                Get.off(() => const HomeView());
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
              child: SizedBox(
                width: 250,
                child:
                    isLoading?
                    Center(child:   JumpingDotsProgressIndicator(
                      fontSize: 60.0,
                      numberOfDots: 4,
                    ),)
                        :
                AppCashedImage(
                  imageUrl: imageUrl ??
                      'https://tse1.mm.bing.net/th?id=OIP.fO70gw_g_kI00e1gQA-yJgHaE7&pid=Api&P=0',
                  fit: BoxFit.fill,
                ),
              )),
          Expanded(
              child: Container(
                color: kGreyColor,
                child: Row(
                  children: [
                    IconButton(onPressed: startListening
                        ,
                        icon: const Icon(Icons.keyboard_voice, size: 35,
                          color: kPurpleColor,)),
                    Expanded(
                      child: CustomTextFormField(
                        backgroundColor: Colors.grey,
                        verticalPadding: 0,
                        horizontalPadding: 0,
                        keyboardType: TextInputType.text,
                        controller: wordController,
                        text: 'اكتب هنا',
                        validateEmptyText: 'empty'.tr,
                        radius: 10,
                        hintText: 'اكتب هنا',
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.perm_identity, size: 35, color: Colors.black,),
                      onPressed: () {
                        ref.child('wordToImage').set(
                            {
                              'isChange': true,
                              'word': wordController.text,
                              'imageUrl': 'https://s.yimg.com/ny/api/res/1.2/ilPiGpc1rMdofynEhDwdLw--/YXBwaWQ9aGlnaGxhbmRlcjt3PTcwNTtoPTUyOTtjZj13ZWJw/https://media.zenfs.com/en/time_72/79bd0de37aa949e77a6dc7b6e5036760'
                            });
                          setState(() {
                            isLoading=true;
                          });
                          Future.delayed(const Duration(seconds: 5)).then((value) {
                            FirebaseDatabase.instance.reference().child(
                                "wordToImage").once().then((
                                DatabaseEvent snapshot) {
                              WordModel  model=  WordModel.fromJson(snapshot.snapshot.value);
                              setState(() {
                                isLoading=false;
                                imageUrl=model.imageUrl;
                              });

                            });
                          });

                      },
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 3,
              child: Container(
                color: kBackgroundDarkColor,
                child: Center(
                  child: Text(lastWords),
                ),
              )),
        ],
      ),
    );
  }


  void startListening() async {
    lastWords = "";
    lastError = "";
    // var locales = await speech.locales();
    // var selectedLocale = locales[LocaleName.];
    speech.listen(onResult: resultListener, localeId: 'ar');
    setState(() {

    });
  }

  void stopListening() {
    speech.stop();
    setState(() {

    });
  }

  void cancelListening() {
    speech.cancel();
    setState(() {

    });
  }

  void resultListener(SpeechRecognitionResult result) {
    setState(() {
      lastWords = "${result.recognizedWords} - ${result.finalResult}";
    });
  }

  void errorListener(SpeechRecognitionError error) {
    setState(() {
      lastError = "${error.errorMsg} - ${error.permanent}";
    });
  }

  void statusListener(String status) {
    setState(() {
      lastStatus = status;
    });
  }


  retreiveDate(){
   return FutureBuilder(
     future: WordToImageService().getWordData(),
       builder: (_,snap){
       WordModel wordModel=snap.data as WordModel;
     if(snap.connectionState==ConnectionState.waiting){
       return const Center(child: CircularProgressIndicator());
     }else if(snap.connectionState==ConnectionState.done){
       return AppCashedImage(
         imageUrl: wordModel.imageUrl ??
             'https://tse1.mm.bing.net/th?id=OIP.fO70gw_g_kI00e1gQA-yJgHaE7&pid=Api&P=0',
         fit: BoxFit.fill,
       );
     }else{
       return const SizedBox();
     }
   });
  }
}
