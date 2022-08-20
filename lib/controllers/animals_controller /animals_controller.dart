// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/animals_model.dart';
import 'package:clds/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/shake_widget.dart';

class AnimalsController extends GetxController {
  RxList<AnimalsModel> allAnimals = <AnimalsModel>[].obs;
  RxList<AnimalsModel> animals = <AnimalsModel>[].obs;
  RxList<AnimalsModel> animal2 = <AnimalsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<GlobalKey<ShakeWidgetState>> shakeKey =
      <GlobalKey<ShakeWidgetState>>[].obs;

  final _databaseService = DatabaseService();

  void getAnimals() async {
    isLoading.value = true;

    // getIbisakuzo() async{
    //   var response = await _databaseService.getIbisakuzo();
    //   print("ibisakuzo byacu ${response.length}");
    // }

    List<AnimalsModel> animalsResponse = await _databaseService.getAnimals();
    print("length animals=========> ${animalsResponse.length}");
    allAnimals.value = animalsResponse;
    animals.value = animalsResponse.getRange(0, 4).toList();
    animals.shuffle();
    animal2.value = animals;

    shakeKey.value =
        List.generate(animals.length, (index) => GlobalKey<ShakeWidgetState>());

    Random random = new Random();
    int randomNumber = random.nextInt(animals.length);
    selectedUpIndex.value = randomNumber;

    isLoading.value = false;
  }

  void changeList() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    allAnimals.shuffle();
    animals.value = allAnimals.getRange(4, 8).toList();
    animals.shuffle();
    animal2.value = animals;
  }

  @override
  void onInit() {
    getAnimals();
    super.onInit();
  }
}
