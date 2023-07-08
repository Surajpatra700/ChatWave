// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/message/photoview/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class PhotoImageView extends GetView<PhotoImageViewController> {
  const PhotoImageView({super.key});

  AppBar _buildAppBar() {
    return AppBar(
      bottom: PreferredSize(
        child: Container(
          color: Colors.black,
          height: 2.0,
        ),
        preferredSize: Size.fromHeight(1.0),
      ),
      title: Text(
        "Photoview",
        style: TextStyle(
          color: AppColor.primaryText,
          fontSize: 16.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        child: PhotoView(
          imageProvider: NetworkImage(controller.state.url.value)
        ),
      ),
    );
  }
}
