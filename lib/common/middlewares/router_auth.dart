// import 'package:chat_wave/common/routes/names.dart';
// import 'package:chat_wave/common/store/user.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// // Check if the user has logged in
// class RouteAuthMiddleware extends GetMiddleware {
// // priority smaller then better

//   @override
//   int? priority = 0;

//   RouteAuthMiddleware({
//     required this.priority,
//   });

//   @override
//   RouteSettings? redirect(String? route){
//     // UserStore.to.isLogin
//     if(UserStore.to.isLogin || route == AppRoutes.SIGN_IN || route == AppRoutes.INITIAL || route == AppRoutes.Message){
//       return null;
//     }else{
//       Future.delayed(Duration(seconds: 2), ()=> Get.snackbar("Tips", "Login expired, please login again!"));
//       return const RouteSettings(name: AppRoutes.SIGN_IN);
//     }
//   }
// }
