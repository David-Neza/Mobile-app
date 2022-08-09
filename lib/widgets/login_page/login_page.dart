// ignore_for_file: prefer_const_constructors

import 'package:clds/constants/colors.dart';
import 'package:clds/constants/images.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_dashboard/authentication_controller.dart';

class LoginPage extends GetWidget<AuthenticationController> {
  LoginPage({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Obx(
      () => SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 4),
                child: CircleAvatar(
                  radius: SizeConfig.widthMultiplier * 6,
                  backgroundColor: const Color(0xfff5f6fa),
                  child: Center(
                      child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ))),
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 4),
              Center(
                child: Text(
                  "Login",
                  style: TextAppStyles.titleHyeon,
                ),
              ),
              SizedBox(height: SizeConfig.heightMultiplier * 2),
              Center(
                child: Container(
                  alignment: Alignment.center,
                  height: SizeConfig.heightMultiplier * 24,
                  width: SizeConfig.widthMultiplier * 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(Images.welcomeImg),
                        fit: BoxFit.cover),
                    color: greyLight,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 8),
                child: TextFormField(
                  controller: controller.email.value,
                  validator: (value) => controller.emailValidator(value!),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Enter your email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: const Color(0xfff5f6fa),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: SizeConfig.widthMultiplier * 4),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Muli",
                    ),
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 4,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.widthMultiplier * 8),
                child: TextFormField(
                  controller: controller.password.value,
                  validator: (value) => controller.passwordValidator(value!),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: const Color(0xfff5f6fa),
                    filled: true,
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: SizeConfig.widthMultiplier * 4),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Muli",
                    ),
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
              controller.isLoginLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : Center(
                      child: Container(
                        width: size.width * 0.9,
                        height: size.height * 0.07,
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.black)),
                          child: const Text('Login'),
                          onPressed: () => controller.signWithEmailAndPassword(
                              email: controller.email.value.text,
                              password: controller.password.value.text,
                              key: _formKey),
                        ),
                      ),
                    ),
              SizedBox(height: SizeConfig.heightMultiplier * 4),
            ],
          ),
        ),
      ),
    ));
  }
}
