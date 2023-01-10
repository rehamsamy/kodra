import 'package:get/get.dart';
import 'package:kodra/app/data/storage/local_storage.dart';

class ItemController extends GetxController{
  bool? _isDark;

  setIsDark(bool value){
    _isDark=value;
    LocalStorage.setTheme(value);
    update();
  }

  bool get isDark=>_isDark??false;

  }

