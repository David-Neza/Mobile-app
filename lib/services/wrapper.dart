// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_dashboard/authentication_controller.dart';
import '../widgets/home_dashboard/home_dashboard.dart';
import '../widgets/on_boarding/on_Boarding.dart';
// import 'authentication/authentication_states.dart';

class Wrapper extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.userr.value.uid == '') {
        return HomeOnBoarding();
      } else {
        return HomeDashboard();
      }
      // if (controller.state is UnAuthenticated) {
      //   return HomeOnBoarding();
      // }

      // if (controller.state is Authenticated) {
      //   return HomeDashboard();
      // }
      // return HomeOnBoarding();
    });
  }
}
