import 'package:chat_wave/pages/frames/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();
  final title = "ChatWave";
  final state = WelcomeState();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    print(" WelcomeController ");
  }
}