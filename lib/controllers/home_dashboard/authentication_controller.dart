// ignore_for_file: prefer_const_constructors

import 'package:clds/models/user_models.dart';
import 'package:clds/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/authentication/authentication_states.dart';

class AuthenticationController extends GetxController {
  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  RxBool obscure = true.obs;
  RxBool isLoading = false.obs;
  RxBool isLoginLoading = false.obs;
  // ignore: prefer_const_constructors
  final _authenticationStateStream = AuthenticationState().obs;
  AuthenticationState get state => _authenticationStateStream.value;

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final users = await DatabaseHelper.instance.getUser();

    var user = await  getUser(
        users: users,
        username: username.value.text,
        passsword: password.value.text);

    if (user.object == null) {
      _authenticationStateStream.value = UnAuthenticated();
    } else {
      _authenticationStateStream.value = Authenticated(user: user.object!);
    }
  }

  @override
  void onInit() {
    _getAuthenticatedUser();
    super.onInit();
  }

  String? usernameValidator(String value) {
    if (value.isEmpty) {
      return 'Please, Input a username';
    }
    return null;
  }

  String? emailValidator(String value) {
    if (value.isEmpty || !value.contains('@')) {
      return 'Please, Input a correct email';
    }
    return null;
  }

  String? passwordValidator(String value) {
    if (value.isEmpty) {
      return 'Please, Input a password';
    }
    return null;
  }

  void submitRegister({required GlobalKey<FormState> key}) async {
    isLoading.value = true;
    final isValid = key.currentState!.validate();
    Get.focusScope!.unfocus();
    if (isValid) {
      key.currentState!.save();
      var user = User(
          name: email.value.text.trim(), password: password.value.text.trim());

      await DatabaseHelper.instance.addUser(user);
      _getAuthenticatedUser();
      _authenticationStateStream.value = Authenticated(user: user);
    }
    isLoading.value = false;
  }

  void submitLogin({required GlobalKey<FormState> key}) async {
    isLoginLoading.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var user = await DatabaseHelper.instance.getUser();
      if (await checkUser(
          users: user,
          username: username.value.text,
          passsword: password.value.text)) {
        _authenticationStateStream.value = Authenticated(
            user: await getUser(
                users: user,
                username: username.value.text,
                passsword: password.value.text));
      } else {
        Get.snackbar('Error', 'Invalid password or email',
              snackPosition: SnackPosition.TOP,
              backgroundColor: Colors.red,
              colorText: Colors.white,
              borderRadius: 10,
              margin: EdgeInsets.all(10));
        _authenticationStateStream.value = UnAuthenticated();
      }
    }
    isLoginLoading.value = false;
  }

  Future<bool> checkUser(
      {required List<User> users,
      required String username,
      required String passsword}) async {
    bool status = false;

    // check if user exists and check if the passsword corresponds
    for (var user in users) {
      if (user.name.toLowerCase() == username.toLowerCase() &&
          user.password == passsword) {
        status = true;
      }
    }

    return status;
  }

  getUser(
      {required List<User> users,
      required String username,
      required String passsword}) async {
    // check if user exists and check if the passsword corresponds
    for (var user in users) {
      if (user.name.toLowerCase() == username.toLowerCase() &&
          user.password == passsword) {
        return user;
      }
    }

    return null;
  }

  void changePasswordView() {
    obscure.value = !obscure.value;
  }

  void signOut() async {
    await DatabaseHelper.instance.drop();
    _authenticationStateStream.value = UnAuthenticated();
  }
}
