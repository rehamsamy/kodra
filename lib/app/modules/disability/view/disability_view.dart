import 'dart:io';
import 'package:flutter/material.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:get/get.dart';
import 'package:kodra/app/shared/app_cached_image.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DisabilityView extends StatefulWidget {
  const DisabilityView({Key? key}) : super(key: key);

  @override
  State<DisabilityView> createState() => _DisabilityViewState();
}

class _DisabilityViewState extends State<DisabilityView> {
  File? imageFile = null;
  File? cameraFile;
  TextToSpeech tts = TextToSpeech();
  String text = 'hello';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0;

  @override
  Widget build(BuildContext context) {
    FlutterTts ftts = FlutterTts();

    return Scaffold(
        appBar: AppBar(
          title: const AppText(
            'ذوي القدرة السمعية',
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
                    child: imageFile == null
                        ? const AppCashedImage(
                            imageUrl:
                                'https://tse1.mm.bing.net/th?id=OIP.fO70gw_g_kI00e1gQA-yJgHaE7&pid=Api&P=0',
                            fit: BoxFit.fill,
                          )
                        : Image.file(
                            imageFile!,
                            width: 250,
                            height: 100,
                          ))),
            Expanded(
                child: Container(
              color: kGreyColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _showChoiceDialog(context);
                        },
                        icon: const Icon(
                          Icons.camera_alt,
                          size: 40,
                          color: kPurpleColor,
                        )),
                    const Icon(
                      Icons.perm_identity,
                      size: 40,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            )),
            Expanded(
                flex: 3,
                child: Container(
                  color: kBackgroundDarkColor,
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topStart,
                        child: IconButton(
                          icon:const Icon(Icons.volume_up,size: 40,),
                          color: Colors.black,
                          onPressed: () async{
                            // speak();
                            //your custom configuration
                            await ftts.setLanguage("ar-sa");
                            await ftts.setSpeechRate(0.5); //speed of speech
                            await ftts.setVolume(1.0); //volume of speech
                            await ftts.setPitch(1); //pitc of sound
                            //play text to sp
                            // var result = await ftts.speak("Hello World, this is Flutter Campus.");
                            var result = await ftts.speak("مرحبا بكم");
                            if(result == 1){
                              print('speaking');
                            }else{
                              print('not speaking');
                            }
                          },
                        ),
                      ),
                      Text('lastWords'),
                    ],
                  ),
                )),
          ],
        ));
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
    Navigator.pop(context);
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "اختر مصدر الصورة",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: const Text("Gallery"),
                    leading: const Icon(
                      Icons.image,
                      color: kPurpleColor,
                    ),
                  ),
                  const Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: const Text("Camera"),
                    leading: const Icon(
                      Icons.camera_alt_rounded,
                      color: kPurpleColor,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }


  void speak() {
    tts.setVolume(volume);
    tts.setRate(rate);
    // if (languageCode != null) {
      tts.setLanguage( 'ar-EG');
    // }
    tts.setPitch(pitch);
    tts.speak(text);
  }

}
