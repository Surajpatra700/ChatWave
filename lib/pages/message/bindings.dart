// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/contacts/controller.dart';
import 'package:chat_wave/pages/frames/application/controller.dart';
import 'package:chat_wave/pages/message/controller.dart';
import 'package:get/get.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<ApplicationController>(() => ApplicationController());
    Get.lazyPut<ContactController>(() => ContactController());
  }
}
