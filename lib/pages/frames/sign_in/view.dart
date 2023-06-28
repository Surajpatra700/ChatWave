import 'package:chat_wave/common/store/storage.dart';
import 'package:chat_wave/pages/frames/sign_in/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SignInPage extends GetView<SignInController> {
  // const SignInPage({super.key});

  Widget _buildLogo() {
    return Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Text(
          "ChatWave",
          style: TextStyle(fontSize: 34.sp, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget _buildGoogleLogin(String loginType) {
    return GestureDetector(
      onTap: () async{
        await controller.handleSignIn("google");
      },
      child: Container(
        margin: EdgeInsets.only(top: 100, bottom: 15),
        width: 300.w,
        height: 50.h,
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(4, 5),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.transparent,
                child: Image.network(
                  "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Sign in with Google",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFacebookLogin(String loginType) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: 300.w,
        height: 50.h,
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(4, 5),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.transparent,
                child: Image.network(
                  "https://cdn3.iconfinder.com/data/icons/free-social-icons/67/facebook_circle_color-512.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              " Sign in with Facebook",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPhoneLogin(String loginType) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: 300.w,
        height: 50.h,
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(4, 5),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.transparent,
                child: Image.network(
                  "https://image.similarpng.com/very-thumbnail/2021/01/Call-icon-on-transparent-background-PNG.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              "Sign in with phone number",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppleLogin(String loginType) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        width: 300.w,
        height: 50.h,
        //color: Colors.white,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(4, 5),
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.transparent,
                child: Image.network(
                  "https://media.idownloadblog.com/wp-content/uploads/2018/07/Apple-logo-black-and-white-429x500.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              " Sign in with Apple",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: Column(
          children: [
            _buildLogo(),
            _buildGoogleLogin("Google"),
            _buildFacebookLogin("Facebook"),
            _buildAppleLogin("Apple"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 18, left: 30, right: 30, bottom: 18),
              child: Row(
                children: [
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.black45,
                  )),
                  Text(
                    " or ",
                    textScaleFactor: 1.1,
                  ),
                  Expanded(
                      child: Divider(
                    thickness: 1,
                    color: Colors.black45,
                  )),
                ],
              ),
            ),
            _buildPhoneLogin("phone"),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                Text(
                  "Already have an account",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 13.sp,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign up here",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
