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

  void goLogout() async {
    await GoogleSignIn().signOut();
    await UserStore.to.onLogout();
  }
}
