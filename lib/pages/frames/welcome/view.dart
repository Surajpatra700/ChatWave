import 'package:chat_wave/pages/frames/welcome/controller.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFF0CAE11),
      //backgroundColor: Color.fromRGBO(13, 91, 154, 1),
      body: Obx(
        () => SizedBox(
            width: 360.w,
            height: 780.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  scrollDirection: Axis.horizontal,
                  reverse: false,
                  onPageChanged: (index) {
                    controller.changePage(index);
                  },
                  controller: PageController(
                    initialPage: 0,
                    keepPage: false,
                    viewportFraction: 1,
                  ),
                  pageSnapping: true,
                  physics: const ClampingScrollPhysics(),
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            "https://signal.avg.com/hs-fs/hubfs/Blog_Content/Avg/Signal/AVG%20Signal%20Images/Guide%20to%20Android%20App%20Permissions%20and%20How%20to%20Use%20Them%20Smartly%20(Signal)%20-%20refresh/img_01.png?width=350&name=img_01.png"),
                        fit: BoxFit.fill,
                      )),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            "https://www.androidauthority.com/wp-content/uploads/2021/10/Android-12-App-Allowed-Permissions-Screenshot.jpg"),
                        fit: BoxFit.fill,
                      )),
                    ),
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        image: NetworkImage(
                            "https://android.calengoo.com/pagedoc/pageinstallation/styled/pagepermissions_files/screenshot_1547023372.png"),
                        fit: BoxFit.fill,
                      )),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          Positioned(
                              bottom: 90,
                              child: ElevatedButton(
                                  onPressed: () {
                                    controller.handleSignIn();
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.white),
                                    foregroundColor:
                                        MaterialStateProperty.all(Colors.black),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                                    side: MaterialStateProperty.all(
                                        const BorderSide(color: Colors.white)),
                                  ),
                                  child: Text("Login"))),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  child: DotsIndicator(
                    position: controller.state.index.value.toInt(),
                    dotsCount: 3,
                    mainAxisAlignment: MainAxisAlignment.center,
                    decorator: DotsDecorator(
                        size: Size.square(9),
                        activeSize: Size(18.0, 9.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        )),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
