import 'package:chat_wave/common/entities/user.dart';
import 'package:get/get.dart';

class ContactState {
  var count = 0.obs;
  RxList<UserData> contactList = <UserData>[].obs;
}