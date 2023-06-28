import 'package:chat_wave/common/entities/user.dart';
import 'package:chat_wave/common/routes/names.dart';
import 'package:chat_wave/common/store/user.dart';
import 'package:chat_wave/pages/frames/sign_in/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignInController extends GetxController {
  SignInController();
  final title = "ChatWave";
  final state = SignInState();

  final db = FirebaseFirestore.instance;

  Future<void> handleSignIn(String type) async {
    // 1. email-password 2. google 3. facebook 4. apple 5. phone
    try {
      if (type == "phone number") {
        if (kDebugMode) {
          print("... You are logging with phone number ...");
        }
      } else if (type == "google") {
        GoogleSignIn googleSignIn = GoogleSignIn(scopes: ["openid"]);
        var user = await googleSignIn.signIn();
        if (user != null) {
          final _gAuthentication = await user.authentication;
          final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken,
          );
          await FirebaseAuth.instance.signInWithCredential(_credential);
          String displayName = user.displayName ?? user.email;
          String email = user.email;
          String id = user.id;
          String photoUrl = user.photoUrl ??
              "assets/images/person.png";
          UserLoginResponseEntity userProfile = UserLoginResponseEntity();
          userProfile.photoUrl = photoUrl;
          userProfile.displayName = displayName;
          userProfile.email = email;
          userProfile.accessToken = id;
          //userProfile.type = 2;
          //asyncPostAllData();
          UserStore.to.saveProfile(userProfile);
          var userbase = await db
              .collection("users")
              .withConverter(
                fromFirestore: UserData.fromFirestore,
                toFirestore: (UserData userdata, options) =>
                    userdata.toFirestore(),
              )
              .where("id", isEqualTo: id)
              .get();

          if (userbase.docs.isEmpty) {
            final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photourl: photoUrl,
              location: "",
              fcmtoken: "",
              addtime: Timestamp.now(),
            );
            await db
                .collection("users")
                .withConverter(
                  fromFirestore: UserData.fromFirestore,
                  toFirestore: (UserData userdata, options) =>
                      userdata.toFirestore(),
                )
                .add(data);
          }else{
            
          }
          //toastInfo(msg: "login succesful");
          print("login succesful");
          Get.offAllNamed(AppRoutes.Application);
          //Get.to(ApplicationPage());
          // asyncPostAllData();
        }
      } else {
        if (kDebugMode) {
          print("... Login type not sure ...");
        }
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
      //print(e.toString());
    }
  }

  // asyncPostAllData() {
  //   print("... Let's go to message... ");
  //   Get.offAllNamed(AppRoutes.Message);
  // }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Get.snackbar("ChatWave", "User is currently logged out");
      } else {
        Get.snackbar("ChatWave", "User is logged in");
      }
    });
  }
}
