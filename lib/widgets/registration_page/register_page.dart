// ignore_for_file: prefer_const_constructors

import 'package:clds/constants/colors.dart';
import 'package:clds/constants/images.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/home_dashboard/authentication_controller.dart';

class RegisterPage extends GetWidget<AuthenticationController>{
    RegisterPage({Key? key}) : super(key: key);
     final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context){
     return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            SizedBox(height: SizeConfig.heightMultiplier * 8),
            Container(
              child: Column(
                children: 
                [  
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
                  Text(
                    "Register",
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
                   Container(
                    height: 60,
                    width: 350,
                    margin: const EdgeInsets.only(top: 50.0),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: controller.username.value,
                      validator: (value)=>controller.usernameValidator(value!),
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'username',
                        ), 
                    ) 
                  ,),
                  Container(
                    height: 60,
                    width: 350,
                    margin: const EdgeInsets.only(top: 50.0),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: controller.email.value,
                      validator: (value)=>controller.emailValidator(value!),
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Email',
                        ), 
                    ) 
                  ,),
                  Container(
                    height: 60,
                    width: 350,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      obscureText: true,
                      controller: controller.password.value,
                      validator: (value)=>controller.passwordValidator(value!),
                       decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ), 
                    ) 
                  ),
              controller.isLoading.value?Center(child: CircularProgressIndicator()):    Container(
                      height: 40,
                      width: 350,
                      padding: const EdgeInsets.fromLTRB(10,0,10,0),
                      child: 
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.black),
                        ),
                        child: const Text('Register'),
                        onPressed: ()=> controller.submitRegister(key: _formKey),
                        ),
                  )       
                ],),
            )
          ],
        ),
      ),    
    ));
  }
}
