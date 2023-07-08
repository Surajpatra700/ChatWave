import 'package:chat_wave/pages/message/photoview/state.dart';
import 'package:get/get.dart';

class PhotoImageViewController extends GetxController {
  PhotoImageViewController();
  //final title = "ChatWave";
  final state = PhotoImageViewState();

  @override
  void onInit() {
    super.onInit();
    var data = Get.parameters;
    if (data['url'] != null) {
      state.url.value = data['url']!;
      
    }
  }
}
