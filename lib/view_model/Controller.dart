import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../view/home_screen.dart';
import 'auth.dart';
import '../view/login_screen.dart';

class ControlView extends GetWidget<Auth> {
  const ControlView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Get.put(Auth(), permanent: true);
      return (Get.find<Auth>().user == null)
          ? LoginScreen()
          : HomeScreen();

    });
  }


}
