// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/contacts/controller.dart';
import 'package:chat_wave/pages/frames/application/index.dart';
import 'package:chat_wave/pages/message/index.dart';
import 'package:get/get.dart';

class ApplicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
    Get.lazyPut<MessageController>(() => MessageController());
  }
}
