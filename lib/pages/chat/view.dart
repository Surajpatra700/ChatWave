// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_wave/common/style/appColor.dart';
import 'package:chat_wave/pages/chat/index.dart';
import 'package:chat_wave/pages/chat/widgets/chat_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});
  

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          )),
      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 176, 106, 231),
              Color.fromARGB(255, 166, 112, 231),
              Color.fromARGB(255, 131, 123, 231),
              Color.fromARGB(255, 104, 132, 231),
            ],
            transform: GradientRotation(90),
          ),
        ),
      ),
      title: Container(
        padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
              child: InkWell(
                child: SizedBox(
                  width: 44.w,
                  height: 44.w,
                  // HELPS TO CALL IMAGE FROM NETWORK
                  child: CachedNetworkImage(
                    imageUrl: controller.state.to_avatar.value,

                    // IMAGE BUILDER IS USED TO STYLE THE WIDGET
                    imageBuilder: (context, imageProvider) => Container(
                      height: 44.w,
                      width: 44.w,
                      margin: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(44.w)),
                        image: DecorationImage(
                            image: imageProvider, fit: BoxFit.cover),
                      ),
                    ),
                    errorWidget: (context, url, error) => Image(
                      image: AssetImage("assets/images/profile_img.jpg"),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Container(
                width: 120.w,
                padding: EdgeInsets.only(top: 0.w, bottom: 0.w, right: 0.w),
                child: Row(
                  children: [
                    SizedBox(
                      width: 120.w,
                      height: 44.w,
                      child: GestureDetector(
                        onTap: () {},
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 5.w),
                              child: Text(
                                controller.state.to_name.value,
                                overflow: TextOverflow.clip,
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: "avenir",
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primaryBackground,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                            Text(
                              "unknown location",
                              overflow: TextOverflow.clip,
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: "avenir",
                                fontWeight: FontWeight.normal,
                                color: AppColor.primaryBackground,
                                fontSize: 14.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.videocam_rounded,
                  color: Colors.white,
                  size: 27,
                )),
            PopupMenuButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                itemBuilder: (context) => [
                      PopupMenuItem(child: Text("chatwave")),
                    ]),
          ],
        ),
      ),
    );
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            children: [
              ChatList(),
              Positioned(
                bottom: 0.h,
                height: 55.h,
                child: Container(
                  width: 360.w,
                  height: 55.h,
                  color: AppColor.primaryBackground,
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 12.w),
                        child: Container(
                          width: 217.w,
                          height: 55.h,
                          child: TextFormField(
                            keyboardType: TextInputType.multiline,
                            //maxLengthEnforcement: null,
                            maxLines: null,
                            controller: controller.textController,
                            autofocus: false,
                            focusNode: controller.contentNode,
                            decoration: InputDecoration(
                              hintText: "Messages...",
                              hintStyle: TextStyle(fontSize: 17.5),
                              //prefixIcon: Icon(Icons.emoji_emotions),
                              //border: OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(30))),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 47.h,
                        width: 47.w,
                        margin: EdgeInsets.only(left: 5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                        // child:  Icon(
                        //     Icons.attach_file,
                        //     weight: 10,
                        //     size: 35.w,
                        //     color: Colors.blue,
                        //   ),
                        child: SpeedDial(
                          animationDuration: Duration(milliseconds: 250),
                          animatedIcon: AnimatedIcons.view_list,
                          spacing: 8,
                          spaceBetweenChildren: 12,
                          overlayColor: Colors.black,
                          overlayOpacity: 0.2,
                          children: [
                            SpeedDialChild(
                              backgroundColor: Color.fromARGB(255, 10, 160, 15),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  )),
                            ),
                            SpeedDialChild(
                              backgroundColor: Color.fromARGB(255, 144, 5, 169),
                              child: IconButton(
                                  onPressed: () {
                                    controller.imgFromGallery();
                                    
                                  },
                                  icon: Icon(
                                    Icons.photo_library,
                                    color: Colors.white,
                                  )),
                            ),
                            SpeedDialChild(
                              backgroundColor: Color.fromARGB(255, 223, 135, 3),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.file_copy,
                                    color: Colors.white,
                                  )),
                            ),
                            SpeedDialChild(
                              backgroundColor: Color.fromARGB(255, 8, 132, 234),
                              child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        //),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10.w, top: 5.h),
                        width: 60.w,
                        height: 44.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: ElevatedButton(
                              onPressed: () {
                                controller.sendMessage();
                              },
                              child: Icon(Icons.send)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
