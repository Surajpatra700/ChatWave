// ignore_for_file: prefer_const_constructors

import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/frames/application/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  //final title = "ChatWave";
  final state = ChatState();
  var doc_id = null;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id'];
    state.to_uid.value = data['to_uid'] ?? "";
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
  }
}
