import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/profiles/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  Widget _buildProfilePhoto() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 120.w,
          height: 120.h,
          decoration: BoxDecoration(
            color: AppColor.primarySecondaryBackground,
            borderRadius: BorderRadius.circular(60.w),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Image(image: AssetImage("assets/images/person.png")),
        ),
        Positioned(
          bottom: 5.w,
          right: 0.w,
          height: 35.w,
          child: GestureDetector(
            child: Container(
              height: 35.w,
              width: 35.w,
              decoration: BoxDecoration(
                color: AppColor.primaryElement,
                borderRadius: BorderRadius.circular(40.w),
              ),
              child: Icon(Icons.edit,color: Colors.white,),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDataButton() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 60.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: AppColor.primaryElement,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Complete",
              style: TextStyle(
                color: AppColor.primaryElementText,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogoutButton() {
    return GestureDetector(
      child: Container(
        width: 295.w,
        height: 44.h,
        margin: EdgeInsets.only(top: 0.h, bottom: 30.h),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(5.w),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Logout",
              style: TextStyle(
                color: AppColor.primaryElementText,
                fontSize: 15.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Get.defaultDialog(
          title: "Are you sure want to log out?",
          titleStyle: TextStyle(fontSize: 16.sp),
          content: Container(),
          onConfirm: () {
            controller.goLogout();
          },
          onCancel: () {
            //Get.back();
          },
          textConfirm: "Confirm",
          textCancel: "Cancel",
          confirmTextColor: Colors.white,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildProfilePhoto(),
                    _buildDataButton(),
                    _buildLogoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
