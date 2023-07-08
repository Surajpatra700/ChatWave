// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chat_wave/common/entities/msg.dart';
import 'package:chat_wave/common/services/date.dart';
import 'package:chat_wave/pages/message/controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MessageList extends GetView<MessageController> {
  const MessageList({super.key});

  Widget MessageListItem(QueryDocumentSnapshot<Msg> item) {
    return Container(
      padding: EdgeInsets.only(top: 10.w, left: 15.w, right: 15.w),
      child: InkWell(
        onTap: () {
          var to_uid = "";
          var to_name = "";
          var to_avatar = "";
          if (item.data().from_uid == controller.token) {
            to_uid = item.data().to_uid ?? "";
            to_name = item.data().to_name ?? "";
            to_avatar = item.data().to_avatar ?? "https://w0.peakpx.com/wallpaper/871/154/HD-wallpaper-pikachu-amoled-iphone-pokemon-samsung.jpg";
          } else {
            to_uid = item.data().from_uid ?? "";
            to_name = item.data().from_name ?? "";
            to_avatar = item.data().from_avatar ?? "https://w0.peakpx.com/wallpaper/871/154/HD-wallpaper-pikachu-amoled-iphone-pokemon-samsung.jpg";
          }
          Get.toNamed("/chat", parameters: {
            "doc_id": item.id,
            "to_uid": to_uid,
            "to_name": to_name,
            "to_avatar": to_avatar,
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 0.w, left: 0.w, right: 15.w),
              child: SizedBox(
                height: 54.w,
                width: 54.w,
                child: CachedNetworkImage(
                  imageUrl: item.data().from_uid == controller.token
                      ? item.data().to_avatar!
                      //? item.data().to_avatar!
                      // : (item.data().from_avatar) == null
                      //     ? "https://w0.peakpx.com/wallpaper/871/154/HD-wallpaper-pikachu-amoled-iphone-pokemon-samsung.jpg"
                          : item.data().from_avatar??"https://w0.peakpx.com/wallpaper/871/154/HD-wallpaper-pikachu-amoled-iphone-pokemon-samsung.jpg",
                  imageBuilder: (context, imageProvider) => Container(
                    width: 54.w,
                    height: 54.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(54)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  errorWidget: (context, url, error) => Image(
                      image: AssetImage("assets/images/profile_img.jpg")),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 0.w, left: 0.w, right: 5.w),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xffe5e5e5)),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 200.w,
                    height: 48.w,
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.data().from_uid == controller.token
                              ? item.data().to_name!
                              // : (item.data().from_name != null)
                                  : item.data().from_name??"Unknown",
                                  // : "Suraj Patra",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16.sp,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            item.data().last_msg ?? "",
                            overflow: TextOverflow.clip,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: "Avenir",
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 55.w,
                    height: 50.w,
                    child: Column(
                      children: [
                        Text(
                          duTimeLineFormat(
                            (item.data().last_time as Timestamp).toDate(),
                          ),
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style: TextStyle(
                            fontFamily: "Avenir",
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                            fontSize: 13.sp,
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
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        controller: controller.refreshController,
        onLoading: controller.onLoading,
        onRefresh: controller.onRefresh,
        header: WaterDropHeader(),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.w),
              sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                (context, index) {
                  var item = controller.state.msgList[index];
                  return MessageListItem(item);
                },
                childCount: controller.state.msgList.length,
              )),
            ),
          ],
        ),
      ),
    );
  }
}
