// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:clds/constants/colors.dart';
import 'package:clds/constants/images.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/text_styles.dart';
import '../../routes/route_link.dart';

class HomeOnBoarding extends StatelessWidget {
  const HomeOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: SizeConfig.heightMultiplier * 4),
          Container(
            child: Column(
              children: [
                CircleAvatar(
                  radius: SizeConfig.widthMultiplier * 6,
                  backgroundImage: const AssetImage(Images.flagImage),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Text(
                  "Welcome",
                  style: TextAppStyles.titleHyeon,
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Container(
                  alignment: Alignment.center,
                  height: 253,
                  width: 253,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.welcomeImg),
                        fit: BoxFit.cover),
                    color: greyLight,
                  ),
                ),
                SizedBox(height: SizeConfig.heightMultiplier * 4),
                Container(
                  alignment: Alignment.center,
                  height: SizeConfig.heightMultiplier * 6,
                  width: SizeConfig.widthMultiplier * 44,
                  child: Text(
                      "The best place to learn all things Rwandan Culture!",
                      textAlign: TextAlign.center,
                      style: TextAppStyles.simpleMediumText),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.widthMultiplier * 12),
            child: Container(
                height: SizeConfig.heightMultiplier * 6,
                // width: SizeConfig.widthMultiplier * 44,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteLinks.loginPage),
                      child: Text("Login",
                          textAlign: TextAlign.center,
                          style: TextAppStyles.simpleText),
                    ),
                    GestureDetector(
                      onTap: () => Get.toNamed(RouteLinks.registerPage),
                      child: Text("SignUp",
                          textAlign: TextAlign.center,
                          style: TextAppStyles.simpleText),
                    ),
                  ],
                )),
          ),
        ],
      ),
    ));
  }
}
