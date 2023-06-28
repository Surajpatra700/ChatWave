
import 'package:chat_wave/common/routes/pages.dart';
import 'package:chat_wave/common/style/themes.dart';
import 'package:chat_wave/global.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Global.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(360, 780),
        splitScreenMode: true,
        builder: (context, child) => GetMaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: AppTheme.light,
              //home: SignInPage(),
              initialRoute: AppPages.INITIAL, //,
              getPages: AppPages.routes,
            ));
  }
}
