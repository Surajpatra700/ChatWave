// ignore_for_file: prefer_const_constructors

import 'package:chat_wave/pages/chat/widgets/message_list.dart';
import 'package:chat_wave/pages/message/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      // leading: IconButton(
      //     onPressed: () {
      //       Get.back();
      //     },
      //     icon: Icon(
      //       Icons.arrow_back_ios,
      //       color: Colors.white,
      //     )),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            // ignore: prefer_const_literals_to_create_immutables
            colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
            ],
            transform: GradientRotation(90),
          ),
        ),
      ),
      title: Text("Message"),
      centerTitle: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: MessageList(),
    );
  }
}
