
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_dashboard/authentication_controller.dart';
import '../widgets/home_dashboard/home_dashboard.dart';
import '../widgets/login_page/login_page.dart';
import '../widgets/on_boarding/on_Boarding.dart';
import 'authentication/authentication_states.dart';


class Wrapper extends GetWidget<AuthenticationController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.state is UnAuthenticated) {
        return LoginPage();
      }

      if (controller.state is Authenticated) {
        return HomeDashboard();
      }
      return HomeOnBoarding();
    });
  }
}