import 'package:chat_wave/common/middlewares/route_middleware.dart';
import 'package:chat_wave/common/routes/names.dart';
import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/contacts/index.dart';
import 'package:chat_wave/pages/frames/application/index.dart';
import 'package:chat_wave/pages/frames/sign_in/bindings.dart';
import 'package:chat_wave/pages/frames/sign_in/view.dart';
import 'package:chat_wave/pages/frames/welcome/index.dart';
import 'package:chat_wave/pages/message/index.dart';
import 'package:chat_wave/pages/message/photoview/index.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static const Application = AppRoutes.Application;
  static final RouteObserver<Route> observer = RouteObserver();
  static List<String> history = [];

  static final List<GetPage> routes = [
    GetPage(
      name: AppPages.INITIAL,
      page: () => WelcomePage(),
      binding: WelcomeBinding(),
      middlewares: [
        RouteWelcomeMiddleware(priority: 1),
      ]
    ),

    GetPage(
      name: AppRoutes.SIGN_IN,
      page: () => SignInPage(),
      binding: SignInBinding(),
    ),

    GetPage(
      name: AppRoutes.Application,
      page: () => ApplicationPage(),
      binding: ApplicationBinding(),
      //middlewares: [RouteAuthMiddleware(priority: 1)],
    ),

    GetPage(
      name: AppRoutes.Contact,
      page: () => ContactPage(),
      binding: ContactBinding(),
    ),

    GetPage(
      name: AppRoutes.Chat,
      page: () => ChatPage(),
      binding: ChatBinding(),
    ),

    GetPage(
      name: AppRoutes.Photoimgview,
      page: () => PhotoImageView(),
      binding: PhotoImageViewBinding(),
    ),

    GetPage(
      name: AppRoutes.Message,
      page: () => MessagePage(),
      binding: MessageBinding(),
      //middlewares: [RouteAuthMiddleware(priority: 1)],
    ),

    // GetPage(
    //   name: AppRoutes.Profile,
    //   page: () => ProfilePage(),
    //   binding: ProfileBinding(),
    // ),
  ];
}
