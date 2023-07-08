import 'dart:convert';

import 'package:chat_wave/common/entities/user.dart';
import 'package:chat_wave/common/routes/names.dart';
import 'package:chat_wave/common/store/user.dart';
import 'package:chat_wave/pages/frames/sign_in/index.dart';
import 'package:chat_wave/pages/message/index.dart';
import 'package:chat_wave/pages/profiles/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileController extends GetxController {
  ProfileController();
  //final title = "ChatWave";
  final state = ProfileState();

  // void goLogout() async {
  //   await GoogleSignIn().signOut();
  //   await UserStore.to.onLogout();
  // }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
      'https://www.googleapis.com/auth/contacts.readonly'
    ],
  );

  asyncLoadData() async {
    String profile = await UserStore.to.getProfile();
    if (profile.isNotEmpty) {
      UserLoginResponseEntity userdata =
          UserLoginResponseEntity.fromJson(jsonDecode(profile));
      state.head_detail.value = userdata;
    }
  }

  Future<void> onLogOut() async {
    UserStore.to.onLogout();
    await _googleSignIn.signOut();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }

  @override
  void onInit() {
    super.onInit();
    asyncLoadData();
    List MyList = [
      {
        "name": "Account",
        "icon": "assets/images/account.png",
        "route": "/account"
      },
      {"name": "Chat", "icon": "assets/images/chat.jpg", "route": "/chat"},
      {
        "name": "Notification",
        "icon": "assets/images/notification.png",
        "route": "/notification"
      },
      {
        "name": "Privacy",
        "icon": "assets/images/privacy.png",
        "route": "/privacy"
      },
      {"name": "Help", "icon": "assets/images/help.png", "route": "/help"},
      {"name": "About", "icon": "assets/images/about.png", "route": "/about"},
      {
        "name": "Logout",
        "icon": "assets/images/logout.png",
        "route": "/logout"
      },
    ];

    for (int i = 0; i < MyList.length; i++) {
      MeListItem result = MeListItem();
      result.icon = MyList[i]["icon"];
      result.name = MyList[i]["name"];
      result.route = MyList[i]["route"];
      state.meListItem.add(result);
    }
  }
}
