import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/learnFoods_model.dart';
import '../../services/database.dart';

class AdminPanelController extends GetxController {
  final _databaseService = DatabaseService();
  RxList<LearnFoodsModel> foods = <LearnFoodsModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isFoodSubmit = false.obs;

  Rx<TextEditingController> imageLink = TextEditingController().obs;
  Rx<TextEditingController> name = TextEditingController().obs;

  void submit({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isFoodSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          LearnFoodsModel(image: imageLink.value.text, text: name.value.text);
      await _databaseService.createNewFood(food: data, uuid: uuid);
      getFood();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isFoodSubmit.value = false;
  }

  void deleteFood({required String id}) async {
    await _databaseService.deleteFood(uuid: id);
    getFood();
  }

  getFood() async {
    isLoading.value = true;
    var response = await _databaseService.getLearnFoods();
    foods.value = response;
    isLoading.value = false;
  }

  @override
  void onInit() {
    getFood();
    super.onInit();
  }
}
