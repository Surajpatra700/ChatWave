// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:chat_wave/common/entities/user.dart';
import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/profiles/index.dart';
import 'package:chat_wave/pages/profiles/widgets/head_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  AppBar _buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 176, 106, 231),
          Color.fromARGB(255, 166, 112, 231),
          Color.fromARGB(255, 131, 123, 231),
          Color.fromARGB(255, 104, 132, 231),
        ])),
      ),
      title: Text(
        "Profile",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget MeItem(MeListItem item) {
    return Container(
      height: 56.w,
      color: AppColor.primaryBackground,
      margin: EdgeInsets.only(bottom: 1.w),
      padding: EdgeInsets.only(top: 0.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: () {
          if (item.route == "/logout") {
            controller.onLogOut();
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 56.w,
              child: Image(
                image: AssetImage(item.icon ?? ""),
                width: 40.w,
                height: 40.w,
              ),
            ),
            //Spacer(),
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Container(
                margin: EdgeInsets.only(left: 14.w),
                child: Text(
                  item.name ?? "",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 15.sp),
                ),
              ),
            ),
            Spacer(),
            Container(
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.keyboard_arrow_right, size: 22.w))),
          ],
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       child: IconButton(onPressed: (){}, icon: Icon(Icons.keyboard_arrow_right,size: 15.w))
        //     ),
        //   ],
        // ),
        //   ],
        // ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppbar(),
      body: Obx(() => CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
                sliver: SliverToBoxAdapter(
                  child: controller.state.head_detail.value == null
                      ? Container()
                      : HeadItem(controller.state.head_detail.value!),
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.symmetric(
                  vertical: 0.w,
                  horizontal: 0.w,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      var item = controller.state.meListItem[index];
                      return MeItem(item);
                    },
                    childCount: controller.state.meListItem.length,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
