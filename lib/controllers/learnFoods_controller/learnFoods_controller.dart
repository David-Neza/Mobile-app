// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/fruits_model.dart';
import 'package:clds/models/learnFoods_model.dart';
import 'package:clds/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/shake_widget.dart';

class LearnFoodsController extends GetxController {
  RxList<LearnFoodsModel> allFoods = <LearnFoodsModel>[].obs;
  RxList<LearnFoodsModel> foods = <LearnFoodsModel>[].obs;
  RxList<LearnFoodsModel> food2 = <LearnFoodsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<GlobalKey<ShakeWidgetState>> shakeKey =
      <GlobalKey<ShakeWidgetState>>[].obs;

  final _databaseService = DatabaseService();

  void getFoods() async {
    isLoading.value = true;

    // getIbisakuzo() async{
    //   var response = await _databaseService.getIbisakuzo();
    //   print("ibisakuzo byacu ${response.length}");
    // }

    List<LearnFoodsModel> foodsResponse = await _databaseService.getLearnFoods();
    print("length =========> ${foodsResponse.length}");
    allFoods.value = foodsResponse;
    foods.value = foodsResponse.getRange(0, 4).toList();
    foods.shuffle();
    food2.value = foods;

    shakeKey.value =
        List.generate(foods.length, (index) => GlobalKey<ShakeWidgetState>());

    Random random = new Random();
    int randomNumber = random.nextInt(foods.length);
    selectedUpIndex.value = randomNumber;

    isLoading.value = false;
  }

  void changeList() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    allFoods.shuffle();
    foods.value = allFoods.getRange(4, 8).toList();
    foods.shuffle();
    food2.value = foods;
  }

  @override
  void onInit() {
    getFoods();
    super.onInit();
  }
}
