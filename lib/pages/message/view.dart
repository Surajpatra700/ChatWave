import 'package:chat_wave/pages/message/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagePage extends GetView<MessageController> {
  const MessagePage({super.key});

  Widget _headBar() {
    return Center(
      child: Container(
        width: 330.w,
        height: 50.w,
        margin: EdgeInsets.only(bottom: 20.h, top: 20.h),
        child: Row(
          children: [
            Stack(
              children: [
                GestureDetector(
                  child: Container(
                    width: 44.h,
                    height: 44.h,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22.h),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ]),
                    child: controller.state.head_detail.value.photourl == null
                        ? Image(image: AssetImage("assets/images/person.png"))
                        : Text("Hi"),
                  ),
                  onTap: () {
                    //controller.goProfile();
                  },
                ),
                Positioned(
                  bottom: 5.w,
                  height: 10.w,
                  right: 0.w,
                  child: Container(
                    width: 10.w,
                    height: 10.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.w,
                        color: Colors.grey.withOpacity(0.1),
                      ),
                      color: Color.fromRGBO(17, 124, 20, 1),
                      borderRadius: BorderRadius.circular(15.w),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  pinned: true,
                  title: _headBar(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
