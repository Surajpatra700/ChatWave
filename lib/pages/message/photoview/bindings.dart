// This Class help in binding different UI's with getX controller

import 'package:chat_wave/pages/message/photoview/controller.dart';
import 'package:get/get.dart';

class PhotoImageViewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoImageViewController>(() => PhotoImageViewController());
  }
}
