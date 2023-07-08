// ignore_for_file: prefer_const_constructors

import 'package:chat_wave/pages/contacts/index.dart';
import 'package:chat_wave/pages/frames/application/index.dart';
import 'package:chat_wave/pages/message/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationPage extends GetView<ApplicationController> {
  const ApplicationPage({super.key});

  Widget _buildPageView() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      controller: controller.pageController,
      onPageChanged: controller.handlePageChanged,
      children: [
        MessagePage(),
        ContactPage(),
        Center(child: Container(child: Text("profile"),)),
      ],
    );
  }

  Widget _buildBottomNavigationBar(){
    return Obx(
      () => BottomNavigationBar(
        items: controller.bottomTabs,
        currentIndex: controller.state.page,
        type: BottomNavigationBarType.fixed,
        onTap: controller.handleNavBarTap,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey.shade400,
        selectedItemColor: Color.fromARGB(255, 65, 7, 164),
        //selectedItemColor: Color.fromARGB(255, 6, 171, 11),

      ),
    );
  }  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageView(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
