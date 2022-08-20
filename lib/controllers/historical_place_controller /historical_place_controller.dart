// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/historical_places.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class HistoricalPlacesController extends GetxController {
  RxList<HistoricalPlacesModel> allHistoricalPlaces = <HistoricalPlacesModel>[].obs;
  RxList<HistoricalPlacesModel> historicalPlaces = <HistoricalPlacesModel>[].obs;
  RxList<HistoricalPlacesModel> historicalPlace2 = <HistoricalPlacesModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
   RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getHistoricalPlaces() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<HistoricalPlacesModel> historicalPlacesResponse = await _databaseService.getHistoricalPlaces();
      
      print("Historical places list --->> ${historicalPlacesResponse.length}");

    allHistoricalPlaces.value = historicalPlacesResponse;
    historicalPlace2.value = historicalPlacesResponse.getRange(0, 4).toList();
    historicalPlace2.shuffle();
    historicalPlace2.value = historicalPlaces;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    historicalPlaces.value = allHistoricalPlaces.getRange(4, 8).toList();
    historicalPlaces.shuffle();
    historicalPlace2.value = historicalPlaces;
  }

  @override
  void onInit() {
    getHistoricalPlaces();
    super.onInit();
  }
}
