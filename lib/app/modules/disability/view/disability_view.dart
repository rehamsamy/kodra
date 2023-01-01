import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:kodra/app/data/models/word_model.dart';
import 'package:kodra/app/modules/home/home_view.dart';
import 'package:get/get.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app/shared/snack_bar.dart';
import 'package:kodra/app_constant.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_to_speech/text_to_speech.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:video_player/video_player.dart';

class DisabilityView extends StatefulWidget {
  const DisabilityView({Key? key}) : super(key: key);

  @override
  State<DisabilityView> createState() => _DisabilityViewState();
}

class _DisabilityViewState extends State<DisabilityView> {
  FirebaseStorage _storage = FirebaseStorage.instance;
  late VideoPlayerController _controller;
  final fb = FirebaseDatabase.instance;
  ImagePicker videoPicker = ImagePicker();
  File? videoFile;
  File? imageFile = null;
  File? cameraFile;
  String? _uploadedFileURL;
  TextToSpeech tts = TextToSpeech();
  String text = 'hello';
  double volume = 1; // Range: 0-1
  double rate = 1.0; // Range: 0-2
  double pitch = 1.0;
  late final File data;
  String? resultWords;

  @override
  void initState() {
    if (videoFile != null) {
      _controller = VideoPlayerController.network(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
        ..initialize().then((_) {
          // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
          setState(() {});
        });
    }
  }

  playVideo(File videoFile) {
    setState(() {
      _controller = VideoPlayerController.file(videoFile)
        ..initialize().then((_) {
          _controller.play();
          setState(() {});
        });
    });
  }

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
              child: videoFile == null
                  ? const SizedBox()
                  : VideoPlayer(_controller),
              // child: SizedBox(
              //     width: 250,
              //     child: imageFile == null
              //         ? const AppCashedImage(
              //             imageUrl:
              //                 'https://tse1.mm.bing.net/th?id=OIP.fO70gw_g_kI00e1gQA-yJgHaE7&pid=Api&P=0',
              //             fit: BoxFit.fill,
              //           )
              //         : Image.file(
              //             imageFile!,
              //             width: 250,
              //             height: 100,
              //           ))
            ),
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
                          Icons.video_call_outlined,
                          size: 40,
                          color: kPurpleColor,
                        )),
                    // IconButton(
                    //   onPressed: uploadFile,
                    //   icon: const Icon(
                    //     Icons.perm_identity,
                    //     size: 40,
                    //     color: Colors.black,
                    //   ),
                    // ),
                    AppProgressButton(
                      isBordered: true,
                      textColor: Colors.white,
                      backgroundColor: kPurpleColor,
                      // text: 'المستخدم',
                      onPressed: (AnimationController animationController) {
                        print('File Uploaded1');
                        animationController.forward();
                        if(videoFile != null){
                          uploadFile().then((value) {
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              showSnackBar('تم رفع الفيديو بنجاح');
                              animationController.reverse();
                            });
                          });
                        }else{
                          print('step2');
                          Future.delayed(const Duration(seconds: 3)).then((value) {
                            showSnackBar('من فضلك اختر فيديو');
                            animationController.reverse();
                          });
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          AppText(
                            'تحويل',
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          Icon(Icons.forward, size: 20, color: Colors.white),
                        ],
                      ),
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
                          icon: const Icon(
                            Icons.volume_up,
                            size: 40,
                          ),
                          color: Colors.black,
                          onPressed: () async {
                            // speak();
                            //your custom configuration
                            await ftts.setLanguage("ar-sa");
                            await ftts.setSpeechRate(0.5); //speed of speech
                            await ftts.setVolume(1.0); //volume of speech
                            await ftts.setPitch(1); //pitc of sound
                            //play text to sp
                            // var result = await ftts.speak("Hello World, this is Flutter Campus.");
                            var result = await ftts.speak("مرحبا بكم");
                            if (result == 1) {
                              print('speaking');
                            } else {
                              print('not speaking');
                            }
                          },
                        ),
                      ),
                      Center(
                          child: AppText(
                        resultWords ?? 'lastWords',
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      )),
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

  getVideoFromCamera() async {
    final source = await videoPicker.getVideo(source: ImageSource.camera);
    videoFile = File(source!.path);
  }

  getVideoFromGallery() async {
    final source = await videoPicker.getVideo(source: ImageSource.gallery);
    videoFile = File(source!.path);
  }

  Future uploadFile() async {
    final ref = fb.reference();
    print('File Uploaded1$videoFile');
    try {
      final storageReference = FirebaseStorage.instance.ref().child('videos');
      final uploadTask = storageReference.putFile(videoFile!);
      print('File Uploaded1$imageFile');
      String videoUrl = await storageReference.getDownloadURL();
      print('vvvvvvvv  $videoUrl');
      ref
          .child('videoToText')
          .set({'isChange': true, 'word': '', 'videoUrl': videoUrl});

      getWordsString();

      //+++++++++++++++++++   ===>>          upload url to firebase database --------------
    } catch (err) {
      print('vvvvv  $err');
    }
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
                      // _openGallery(context);
                      getVideoFromGallery();
                      playVideo(videoFile ?? File(''));
                      Navigator.pop(context);
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
                      // _openCamera(context);
                      getVideoFromCamera();
                      playVideo(videoFile ?? File(''));
                      Navigator.pop(context);
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
    tts.setLanguage('ar-EG');
    // }
    tts.setPitch(pitch);
    tts.speak(text);
  }

  void getWordsString() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      FirebaseDatabase.instance
          .reference()
          .child("videoToText")
          .once()
          .then((DatabaseEvent snapshot) {
        WordModel model = WordModel.fromJson(snapshot.snapshot.value);
        setState(() {
          resultWords = model.word;
        });
      });
    });
  }
}
