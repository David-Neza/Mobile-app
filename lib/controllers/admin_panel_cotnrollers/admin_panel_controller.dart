import 'package:clds/models/animals_model.dart';
import 'package:clds/models/artifacts_model.dart';
import 'package:clds/models/fruits_model.dart';
import 'package:clds/models/historical_places.dart';
import 'package:clds/models/rwanda_kings_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

import '../../models/learnFoods_model.dart';
import '../../services/database.dart';

class AdminPanelController extends GetxController {
  final _databaseService = DatabaseService();
  RxList<LearnFoodsModel> foods = <LearnFoodsModel>[].obs;
  RxList<FruitsModel> fruits = <FruitsModel>[].obs;
  RxList<AnimalsModel> animals = <AnimalsModel>[].obs;
  RxList<ArtifactsModel> artifacts = <ArtifactsModel>[].obs;
  RxList<HistoricalPlacesModel> historicalPlaces = <HistoricalPlacesModel>[].obs;
  RxList<RwandaKingsModel> rwandaKings = <RwandaKingsModel>[].obs;
  RxBool isLoading = false.obs;
  RxBool isFoodSubmit = false.obs;
  RxBool isFruitSubmit = false.obs;
  RxBool isAnimalSubmit = false.obs;
  RxBool isArtifactSubmit = false.obs;
  RxBool isHistoricalPlaceSubmit = false.obs;
   RxBool isRwandaKingSubmit = false.obs;

  Rx<TextEditingController> imageLink = TextEditingController().obs;
  Rx<TextEditingController> name = TextEditingController().obs;
  Rx<TextEditingController> description = TextEditingController().obs;

  void submitFood({required GlobalKey<FormState> key}) async {
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
    getFood();
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


  void submitFruit({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isFruitSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          FruitsModel(image: imageLink.value.text, text: name.value.text);
      await _databaseService.createNewFruit(fruits: data, uuid: uuid);
      getFruit();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isFruitSubmit.value = false;
    getFruit();
  }

  void deleteFruit({required String id}) async {
    await _databaseService.deleteFruit(uuid: id);
    getFruit();
  }

  getFruit() async {
    isLoading.value = true;
    var response = await _databaseService.getFruits();
    fruits.value = response;
    isLoading.value = false;
  }

  void submitAnimal({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isAnimalSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          AnimalsModel(image: imageLink.value.text, text: name.value.text);
      await _databaseService.createNewAnimal(animals: data, uuid: uuid);
      getAnimal();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isAnimalSubmit.value = false;
    getAnimal();
  }

  void deleteAnimal({required String id}) async {
    await _databaseService.deleteAnimal(uuid: id);
    getAnimal();
  }

  getAnimal() async {
    isLoading.value = true;
    var response = await _databaseService.getAnimals();
    animals.value = response;
    isLoading.value = false;
  }

  //Artifacts

  void submitArtifact({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isArtifactSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          ArtifactsModel(image: imageLink.value.text, text: name.value.text);
      await _databaseService.createNewArtifact(artifacts: data, uuid: uuid);
      getArtifact();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isArtifactSubmit.value = false;
    getArtifact();
  }

  void deleteArtifact({required String id}) async {
    await _databaseService.deleteArtifact(uuid: id);
    getArtifact();
  }

  getArtifact() async {
    isLoading.value = true;
    var response = await _databaseService.getArtifacts();
    artifacts.value = response;
    isLoading.value = false;
  }

  //Historical Place

  void submitHistoricalPlace({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isHistoricalPlaceSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          HistoricalPlacesModel(image: imageLink.value.text, text: name.value.text);
      await _databaseService.createNewHistoricalPlace(historicalPlaces: data, uuid: uuid);
      getHistoricalPlace();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isHistoricalPlaceSubmit.value = false;
    getHistoricalPlace();
  }

  void deleteHistoricalPlace({required String id}) async {
    await _databaseService.deleteHistoricalPlace(uuid: id);
    getHistoricalPlace();
  }

  getHistoricalPlace() async {
    isLoading.value = true;
    var response = await _databaseService.getHistoricalPlaces();
    historicalPlaces.value = response;
    isLoading.value = false;
  }

  ////// Rwanda Kings /////////
  

  void submitRwandaKing({required GlobalKey<FormState> key}) async {
    var uuid = Uuid().v4();
    isRwandaKingSubmit.value = true;
    final isValid = key.currentState!.validate();
    if (isValid) {
      var data =
          RwandaKingsModel( description: description.value.text, image: imageLink.value.text, name: name.value.text);
      await _databaseService.createNewRwandaKing(rwandaKings: data, uuid: uuid);
      getRwandaKings();
      Get.snackbar('Successfully', 'Added',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          borderRadius: 10,
          margin: EdgeInsets.all(10));
    }
    isRwandaKingSubmit.value = false;
    getRwandaKings();
  }

  void deleteRwandaKing({required String id}) async {
    await _databaseService.deleteRwandaKing(uuid: id);
    getArtifact();
  }

  getRwandaKings() async {
    isLoading.value = true;
    var response = await _databaseService.getRwandaKings();
    rwandaKings.value = response;
    isLoading.value = false;
  }


  @override
  void onInit() {
    getFood();
    getFruit();
    getAnimal();
    getArtifact();
    getHistoricalPlace();
    getRwandaKings();
    super.onInit();
  }
}
