import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_wave/common/entities/user.dart';
import 'package:chat_wave/common/widgets/image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// Widget netImageCached(
//   String url, {
//   double width = 48,
//   double height = 48,
//   EdgeInsetsGeometry? margin,
// }) {
//   //return NetworkImage(url);
// }

Widget HeadItem(UserLoginResponseEntity item) {
  return Container(
    padding: EdgeInsets.only(top: 20.w, left: 15.w, right: 15.w, bottom: 15.w),
    margin: EdgeInsets.only(bottom: 30.w),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade700,
          offset: Offset(0.0, 3.0),
          blurRadius: 15.0,
          spreadRadius: 1.0,
        ),
      ],
    ),
    child: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              
            },
            child: SizedBox(
              width: 54.w,
              height: 54.w,
              // child: ClipRRect(
              //   borderRadius: BorderRadius.circular(50),
              //   child: CachedNetworkImage(imageUrl: item.photoUrl??"assets/images/profile_img.jpg")),
            ),
          ),
          SizedBox(
            width: 250.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: 5.w, left: 15.w, right: 0.w, bottom: 0.w),
                  alignment: Alignment.centerLeft,
                  width: 190.w,
                  height: 54.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.displayName ?? "",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "ID: ${item.accessToken ?? ""}",
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          fontFamily: "Avenir",
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ]),
  );
}
