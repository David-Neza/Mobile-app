// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/learnFoods_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class LearnFoodsController extends GetxController {
  RxList<LearnFoodsModel> allFoods = <LearnFoodsModel>[].obs;
  RxList<LearnFoodsModel> foods = <LearnFoodsModel>[].obs;
  RxList<LearnFoodsModel> food2 = <LearnFoodsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
   RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getFoods() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<LearnFoodsModel> foodsResponse = await _databaseService.getLearnFoods();
      
      print("foods list --->> ${foodsResponse.length}");

    allFoods.value = foodsResponse;
    foods.value = foodsResponse.getRange(0, 4).toList();
    foods.shuffle();
    food2.value = foods;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
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
