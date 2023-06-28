// This Class help in binding different UI's with getX controller

import 'package:chat_wave/common/services/config.dart';
import 'package:chat_wave/pages/frames/sign_in/controller.dart';
import 'package:chat_wave/pages/frames/welcome/controller.dart';
import 'package:chat_wave/pages/message/controller.dart';
import 'package:get/get.dart';

class WelcomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
    //Get.put(ConfigStore());
    // Get.lazyPut<SignInController>(() => SignInController());
    // Get.lazyPut<MessageController>(() => MessageController());
  }
}
