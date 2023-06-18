import 'package:chat_wave/common/routes/names.dart';
import 'package:chat_wave/pages/frames/welcome/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppPages.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
    ),
  ];
}
