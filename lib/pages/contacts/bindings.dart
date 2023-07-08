// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/contacts/index.dart';
import 'package:get/get.dart';

class ContactBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
    //Get.lazyPut<ChatController>(() => ChatController());
  }
}