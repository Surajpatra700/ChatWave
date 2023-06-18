import 'package:chat_wave/pages/frames/welcome/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  Widget _buildPageHeadTitle(String title) {
    return Center(
      child: Container(
        //margin: EdgeInsets.only(top: ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Montserrat",
            fontWeight: FontWeight.bold,
            fontSize: 45,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF0CAE11),
      backgroundColor: Color.fromRGBO(13, 91, 154, 1),
      body: Container(
        width: 360,
        height: 780,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.telegram,size: 85,),
            _buildPageHeadTitle(controller.title)
          ],
        ),
      ),
    );
  }
}
