// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/frames/sign_in/index.dart';
import 'package:get/get.dart';

class SignInBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInController>(() => SignInController());
  }
}
