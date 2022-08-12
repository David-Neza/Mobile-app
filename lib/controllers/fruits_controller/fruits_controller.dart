// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/fruits_model.dart';
import 'package:clds/models/learnFoods_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class FruitsController extends GetxController {
  RxList<FruitsModel> allFruits = <FruitsModel>[].obs;
  RxList<FruitsModel> fruits = <FruitsModel>[].obs;
  RxList<FruitsModel> fruit2 = <FruitsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
   RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getFruits() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<FruitsModel> foodsResponse = await _databaseService.getFruits();
      
      print("fruits list --->> ${foodsResponse.length}");

    allFruits.value = foodsResponse;
    fruits.value = foodsResponse.getRange(0, 4).toList();
    fruits.shuffle();
    fruit2.value = fruits;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    fruits.value = allFruits.getRange(4, 8).toList();
    fruits.shuffle();
    fruit2.value = fruits;
  }

  @override
  void onInit() {
    getFruits();
    super.onInit();
  }
}
