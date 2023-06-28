// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/contacts/controller.dart';
import 'package:chat_wave/pages/frames/application/index.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
