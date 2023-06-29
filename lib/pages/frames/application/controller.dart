// ignore_for_file: prefer_const_constructors

import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/frames/application/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApplicationController extends GetxController {
  ApplicationController();
  //final title = "ChatWave";
  final state = ApplicationState();

  late final List<String> tabTitles;
  late final PageController pageController;
  late final List<BottomNavigationBarItem> bottomTabs;

  void handleNavBarTap(int index) {
    pageController.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
    tabTitles = ['chat', 'contact', 'profile'];
    bottomTabs = [
      BottomNavigationBarItem(
        icon: Icon(
          Icons.chat,
          color: AppColor.primaryThreeElementText,
        ),
        activeIcon: Icon(
          Icons.chat,
          //color: Color.fromARGB(255, 6, 171, 11),
          color: Color.fromARGB(255, 65, 7, 164),
        ),
        label: 'chat',
        backgroundColor: AppColor.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.contact_page,
          color: AppColor.primaryThreeElementText,
        ),
        activeIcon: Icon(
          Icons.contact_page,
          //color: Color.fromARGB(255, 6, 171, 11),
          color: Color.fromARGB(255, 65, 7, 164),
        ),
        label: 'contact',
        backgroundColor: AppColor.primaryBackground,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.person,
          color: AppColor.primaryThreeElementText,
        ),
        activeIcon: Icon(
          Icons.person,
          //color: Color.fromARGB(255, 6, 171, 11),
          color: Color.fromARGB(255, 65, 7, 164),
        ),
        label: 'profile',
        backgroundColor: AppColor.primaryBackground,
      ),
    ];

    pageController = PageController(
      initialPage: state.page,
    );
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void handlePageChanged(int index) {
    state.page = index;
  }
}
