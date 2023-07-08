import 'package:chat_wave/common/routes/names.dart';
import 'package:chat_wave/common/services/config.dart';
import 'package:chat_wave/pages/frames/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  //final title = "ChatWave";
  final state = WelcomeState();

  changePage(int index) {
    state.index.value = index;
  }

  handleSignIn() async {
    await ConfigStore.to.saveAlreadyOpen();
    Get.offAndToNamed(AppRoutes.SIGN_IN);
  }
}
