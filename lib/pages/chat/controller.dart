// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'package:chat_wave/common/entities/msgcontent.dart';
import 'package:chat_wave/common/store/user.dart';
import 'package:chat_wave/pages/chat/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:math';

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

  // String getRandomString(int len) {
  //   var r = Random();
  //   String randomString =
  //       String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  //   return randomString;
  // }

  File? _photo;
  final ImagePicker _picker = ImagePicker();
  Future imgFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      _photo = File(pickedFile.path);
      await uploadFile();
      
    } else {
      print("No image selected");
    }
  }

  Future getImgUrl(String name) async {
    final spaceRef = FirebaseStorage.instance.ref("chat").child(name);
    var str = await spaceRef.getDownloadURL();
    return str;
  }

  sendImageMessage(String url) async {
    final content = Msgcontent(
      uid: user_id,
      content: url,
      type: "image",
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
      "last_msg": "[image]",
      "last_time": Timestamp.now(),
    });
  }

  Future uploadFile() async {
    if (_photo == null) return;
    //final fileName = getRandomString(15) + extension(_photo!.path);
    final fileName = DateTime.now().microsecondsSinceEpoch.toString();
    try {
      final ref = FirebaseStorage.instance.ref("chat").child(fileName);
      await ref.putFile(_photo!).snapshotEvents.listen((event) async {
        switch (event.state) {
          case TaskState.running:
            break;
          case TaskState.paused:
            break;
          case TaskState.success:
            String imgUrl = await getImgUrl(fileName);
            sendImageMessage(imgUrl);
            break;
          default:
            return;
        }
      });
    } catch (e) {
      print(e.toString());
    }
  }

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
    if (sendContent.isNotEmpty) {
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
    } else {
      null;
    }
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
        .orderBy("addtime", descending: false);
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

  @override
  void dispose() {
    msgScrolling.dispose();
    listener.cancel();
    super.dispose();
  }
}
