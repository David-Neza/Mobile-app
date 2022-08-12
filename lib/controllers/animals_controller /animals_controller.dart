// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/animals_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class AnimalsController extends GetxController {
  RxList<AnimalsModel> allAnimals = <AnimalsModel>[].obs;
  RxList<AnimalsModel> animals = <AnimalsModel>[].obs;
  RxList<AnimalsModel> animal2 = <AnimalsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getAnimals() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<AnimalsModel> animalsResponse = await _databaseService.getAnimals();
      
      print("animals list --->> ${animalsResponse.length}");

    allAnimals.value = animalsResponse;
    animals.value = animalsResponse.getRange(0, 4).toList();
    animals.shuffle();
    animal2.value = animals;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
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
