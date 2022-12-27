import 'package:flutter/material.dart';
import 'package:kodra/app/core/get_binding.dart';
import 'package:kodra/app/modules/items/my_drawer.dart';
import 'package:kodra/app/modules/user/view/user_view.dart';
import 'package:kodra/app/shared/app_buttons/app_progress_button.dart';
import 'package:kodra/app/shared/app_text.dart';
import 'package:kodra/app_constant.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}
class _HomeViewState extends State<HomeView> {
  bool isLogin = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kBackgroundColor,
        leading: IconButton(
          icon:const Icon(Icons.menu,color: kPurpleColor,size: 35,),
          onPressed: () => _key.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(onPressed: (){}, icon:  const Icon(Icons.camera_alt,color: kPurpleColor,size: 35,))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(color: kBackgroundColor),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Image.asset(
                'assets/images/icon3.png',
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              Card(
                elevation: 20,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                color: kAuthGreyColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 100.0,horizontal: 25),
                  child: Column(
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: AppProgressButton(
                          isBordered: isLogin ? false : true,
                          backgroundColor: isLogin ? kPurpleColor : Colors.white,
                          textColor: isLogin ? Colors.white : kPurpleColor,
                          // text: 'ذوي الاعاقة السمعية',
                          onPressed: (AnimationController animationController) {
                            setState(() {
                              isLogin = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Icon(Icons.perm_identity,size: 40,color:  isLogin ? Colors.white : kPurpleColor),
                              AppText('ذوي الاعاقة السمعية',color:  isLogin ? Colors.white : kPurpleColor,fontSize: 18,),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        width: Get.width,
                        child: AppProgressButton(
                          isBordered: isLogin ? true : false,
                          textColor: isLogin ? kPurpleColor : Colors.white,
                          backgroundColor: isLogin ? Colors.white : kPurpleColor,
                          // text: 'المستخدم',
                          onPressed: (AnimationController animationController) {
                            setState(() {
                              isLogin = false;
                            });
                            Get.off(()=>UserView(),binding: GetBinding());
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                               Icon(Icons.perm_identity,size: 40,color:isLogin ? kPurpleColor : Colors.white ,),
                              AppText('المستخدم',color:  isLogin ? kPurpleColor : Colors.white,fontSize: 18,),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
