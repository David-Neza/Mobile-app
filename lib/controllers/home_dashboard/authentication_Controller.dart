// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/user.dart';
import '../../routes/route_link.dart';
import '../../services/authentication/authentication_states.dart';
import '../../services/database.dart';

class AuthenticationController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Rx<TextEditingController> username = TextEditingController().obs;
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;
  RxBool obscure = true.obs;
  RxBool isLoading = false.obs;
  RxBool isRegistering = false.obs;
  RxBool isLoging = false.obs;
  RxBool isLoginLoading = false.obs;
  final _authenticationStateStream = AuthenticationState().obs;
  AuthenticationState get state => _authenticationStateStream.value;
  Rx<UserModel> userModel = UserModel().obs;
  final Rx<AppUser> _firebaseUser = AppUser(uid: '').obs;

  Rx<AppUser> get userr => _firebaseUser;
  // final userStorage = LocalStorage('user');

  // // save user
  // void saveUser({required User user}) async {
  //   await userStorage.ready;
  //   userStorage.setItem("user", user.toMap());
  // }

  // // read user object
  // Future<User> getUserDetails() async {
  //   await userStorage.ready;
  //   var data = await userStorage.getItem('user');
  //   if (data == null || data.isEmpty) {
  //     return User(name: '', password: '');
  //   }
  //   User user = User.fromMap(data);
  //   return user;
  // }

  // // remove user object
  // Future<void> deleteUserObject() async {
  //   await userStorage.ready;
  //   await userStorage.clear();
  //   await userStorage.deleteItem('user');
  // }

  // void _getAuthenticatedUser() async {
  //   _authenticationStateStream.value = AuthenticationLoading();

  //   final user = await getUserDetails();

  //   if (user.name == "" || user.password == "") {
  //     _authenticationStateStream.value = UnAuthenticated();
  //   } else {
  //     _authenticationStateStream.value = Authenticated(user: user);
  //   }
  // }

  // @override
  // void onInit() {
  //   _getAuthenticatedUser();
  //   super.onInit();
  // }

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

  // void submitRegister({required GlobalKey<FormState> key}) async {
  //   isLoading.value = true;
  //   final isValid = key.currentState!.validate();
  //   Get.focusScope!.unfocus();
  //   if (isValid) {
  //     key.currentState!.save();
  //     var user = User(
  //         name: email.value.text.trim(), password: password.value.text.trim());

  //     await DatabaseHelper.instance.addUser(user);
  //     Get.snackbar('success', 'User Registered succesfully',
  //         snackPosition: SnackPosition.TOP,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         borderRadius: 10,
  //         margin: EdgeInsets.all(10));
  //     username.value.clear();
  //     email.value.clear();
  //     password.value.clear();
  //     Get.offAllNamed(RouteLinks.wrapper);
  //     // _getAuthenticatedUser();
  //     // _authenticationStateStream.value = Authenticated(user: user);
  //   }
  //   isLoading.value = false;
  // }

  // void submitLogin({required GlobalKey<FormState> key}) async {
  //   isLoginLoading.value = true;
  //   final isValid = key.currentState!.validate();
  //   if (isValid) {
  //     var user = await DatabaseHelper.instance.getUser();
  //     if (await checkUser(
  //         users: user,
  //         email: email.value.text,
  //         passsword: password.value.text)) {
  //       _authenticationStateStream.value = Authenticated(
  //           user: await getUser(
  //               users: user,
  //               email: email.value.text,
  //               passsword: password.value.text));
  //       saveUser(
  //           user: User(name: email.value.text, password: password.value.text));
  //       Get.offAllNamed(RouteLinks.wrapper);
  //     } else {
  //       Get.snackbar('Error', 'Invalid password or email',
  //           snackPosition: SnackPosition.TOP,
  //           backgroundColor: Colors.red,
  //           colorText: Colors.white,
  //           borderRadius: 10,
  //           margin: EdgeInsets.all(10));

  //       _authenticationStateStream.value = UnAuthenticated();
  //     }
  //   }
  //   email.value.clear();
  //   password.value.clear();

  //   isLoginLoading.value = false;
  // }

  // Future<bool> checkUser(
  //     {required List<User> users,
  //     required String email,
  //     required String passsword}) async {
  //   bool status = false;
  //   print("checking user");
  //   // check if user exists and check if the passsword corresponds
  //   for (var user in users) {
  //     if (user.name.toLowerCase() == email.toLowerCase() &&
  //         user.password == passsword) {
  //       print("user found");
  //       status = true;
  //     }
  //   }

  //   return status;
  // }

  // getUser(
  //     {required List<User> users,
  //     required String email,
  //     required String passsword}) async {
  //   // check if user exists and check if the passsword corresponds
  //   for (var user in users) {
  //     if (user.name.toLowerCase() == email.toLowerCase() &&
  //         user.password == passsword) {
  //       return user;
  //     }
  //   }

  //   return null;
  // }

  // void changePasswordView() {
  //   obscure.value = !obscure.value;
  // }

  // void signOut() async {
  //   await deleteUserObject();
  //   _authenticationStateStream.value = UnAuthenticated();
  // }

  // ************************ firebase authentication ******************

  _initializeUserModel(String userId) async {
    userModel.value = await _firestore
        .collection("users")
        .doc(userId)
        .get()
        .then((doc) => UserModel.fromDocumentSnapshot(documentSnapshot: doc));
  }

  AppUser _userFromFirebase(User? user) {
    if (user != null) {
      return AppUser(uid: user.uid);
    } else {
      return AppUser(uid: '');
    }
  }

  Future signWithEmailAndPassword(
      {required String email,
      required String password,
      required GlobalKey<FormState> key}) async {
    isLoginLoading.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      try {
        UserCredential result = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        User user = result.user!;
        _initializeUserModel(user.uid);
        _setInitialScreen(_firebaseUser.value);
        return _userFromFirebase(user);
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
    isLoginLoading.value = false;
  }

  Future signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required GlobalKey<FormState> key}) async {
    isRegistering.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      try {
        UserCredential result = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        User user = result.user!;
        //create user in database.dart
        UserModel _user = UserModel(
          id: user.uid,
          email: user.email,
        );
        await DatabaseService()
            .createNewUser(user: _user, name: username.value.text);
        _initializeUserModel(user.uid);
        _setInitialScreen(_firebaseUser.value);
        // todo new user
        return _userFromFirebase(user);
      } catch (e) {
        Get.snackbar('Error', e.toString(),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
    isRegistering.value = false;
  }

  AppUser get user => _firebaseUser.value;

  @override
  onInit() {
    _firebaseUser.bindStream(_auth.authStateChanges().map(_userFromFirebase));

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    _firebaseUser.bindStream(_auth.authStateChanges().map(_userFromFirebase));
    // ever(_firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(AppUser user) {
    if (user.uid == '') {
      Get.offAllNamed(RouteLinks.homeOnBoarding);
      //  Get.offAll(() => HomeOnBoarding());
    } else {
      userModel.bindStream(DatabaseService().getUser(uid: user.uid));

      Get.offAllNamed(RouteLinks.homeDashboard);
      // Get.offAll(() => HomeDashboard());
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      Get.snackbar(
        "An error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
