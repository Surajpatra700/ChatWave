// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_wave/common/entities/msgcontent.dart';
import 'package:chat_wave/common/routes/names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget ChatRightItem(Msgcontent item) {
  return Container(
    //margin: EdgeInsets.all(0),
    padding: EdgeInsets.only(top: 5.w, left: 15.w, right: 15.w,bottom: 3.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 260.w,
            minHeight: 40.w,
          ),
          child: Container(
            margin: EdgeInsets.only(right: 5.w,top: 0.w),
            padding: item.type == "text" ? EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w,bottom: 10.w) :EdgeInsets.only(top: 3.w, left: 3.w, right: 3.w,bottom: 3.w),
            decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
              // Color(0xff2aa4cb),
              // Color.fromRGBO(42, 164, 203, 100),
            ],
            transform: GradientRotation(90),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10.w)),
            ),
            child: item.type == "text"? Text("${item.content}",style: TextStyle(color: Colors.white),) : 
              ConstrainedBox(constraints: BoxConstraints(
                maxWidth: 180.w,
              ),
              child: GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.Photoimgview, parameters: {"url": item.content??""});
                },
                child: CachedNetworkImage(imageUrl: "${item.content}"),
              ),
              ),
            
          ),
        ),
      ],
    ),
  );
}