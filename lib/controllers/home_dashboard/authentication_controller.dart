import 'package:clds/models/user_models.dart';
import 'package:clds/services/database_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/authentication/authentication_states.dart';

class AuthenticationController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  RxBool obscure = true.obs;
  RxBool isLoading = false.obs;
  // ignore: prefer_const_constructors
  final _authenticationStateStream = AuthenticationState().obs;
  AuthenticationState get state => _authenticationStateStream.value;

  void _getAuthenticatedUser() async {
    _authenticationStateStream.value = AuthenticationLoading();

    final user = await DatabaseHelper.instance.getUser();

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

  void submitLogin({required GlobalKey<FormState> key}) async {
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

  void changePasswordView() {
    obscure.value = !obscure.value;
  }

  void signOut() async {
    await DatabaseHelper.instance.drop();
    _authenticationStateStream.value = UnAuthenticated();
  }
}
