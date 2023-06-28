import 'package:chat_wave/common/services/config.dart';
import 'package:chat_wave/common/store/storage.dart';
import 'package:chat_wave/common/store/user.dart';
import 'package:chat_wave/pages/frames/application/controller.dart';
import 'package:chat_wave/pages/frames/sign_in/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<UserStore>(UserStore());
    Get.put<ConfigStore>(ConfigStore());
    Get.put(SignInController());
    Get.lazyPut(() => ApplicationController());
  }
}
