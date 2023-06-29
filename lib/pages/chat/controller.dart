// ignore_for_file: prefer_const_constructors

import 'package:chat_wave/common/entities/msg.dart';
import 'package:chat_wave/common/entities/msgcontent.dart';
import 'package:chat_wave/common/store/user.dart';
import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/frames/application/state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  ChatController();
  //final title = "ChatWave";
  final state = ChatState();
  var doc_id = null;
  final textController = TextEditingController();
  ScrollController msgScrolling = ScrollController();
  FocusNode contentNode = FocusNode();
  final user_id = UserStore.to.token;
  final db = FirebaseFirestore.instance;
  var listener;

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    doc_id = data['doc_id'];
    state.to_uid.value = data['to_uid'] ?? "";
    state.to_name.value = data['to_name'] ?? "";
    state.to_avatar.value = data['to_avatar'] ?? "";
  }

  sendMessage() async {
    String sendContent = textController.text;
    final content = Msgcontent(
      uid: user_id,
      content: sendContent,
      type: "text",
      addtime: Timestamp.now(),
    );
    await db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msgcontent, options) =>
              msgcontent.toFireStore(),
        )
        .add(content)
        .then((DocumentReference doc) {
      print("Document snapshot added with id: ${doc.id}");
      textController.clear();
      // helps to use our text editing controller for another time
      Get.focusScope?.unfocus();
    });
    await db.collection("message").doc(doc_id).update({
      "last_msg": sendContent,
      "last_time": Timestamp.now(),
    });
  }

  @override
  void onReady() {
    super.onReady();
    var messages = db
        .collection("message")
        .doc(doc_id)
        .collection("msglist")
        .withConverter(
          fromFirestore: Msgcontent.fromFirestore,
          toFirestore: (Msgcontent msgcontent, options) =>
              msgcontent.toFireStore(),
        )
        .orderBy("addtime", descending: true);
    state.msgcontentList.clear();
    listener = messages.snapshots().listen(
      (event) {
        for (var change in event.docChanges) {
          switch (change.type) {
            case DocumentChangeType.added:
              if (change.doc.data() != null) {
                state.msgcontentList.insert(0, change.doc.data()!);
              }
              break;
            case DocumentChangeType.modified:
              break;
            case DocumentChangeType.removed:
              break;
          }
        }
      },
      onError: (error) => print("Listened failed: ${error.toString()}"),
    );
  }

  // @override
  // void dispose() {
  //   msgScrolling.dispose();
  //   listener.cancel();
  //   super.dispose();
  // }
}
