import 'package:chat_wave/pages/contacts/index.dart';
import 'package:chat_wave/pages/contacts/widgets/contact_list.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({super.key});

  

  @override
  Widget build(BuildContext context) {

    AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromARGB(255, 176, 106, 231),
            Color.fromARGB(255, 166, 112, 231),
            Color.fromARGB(255, 131, 123, 231),
            Color.fromARGB(255, 104, 132, 231),
          ])
        ),
      ),
      title: Text("Contact",style: TextStyle(
        color: Colors.white,
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
      ),),

    );
  }

    return Scaffold(
      appBar: _buildAppBar(),
      body: const ContactList(),
    );
  }
}
