// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/rwanda_kings_model.dart';
import 'package:clds/models/rwandan_historical_places_model%20.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class RwandanHistoricalPlacesController extends GetxController {
  RxList<RwandanHistoricalPlacesModel> allRwandanHistoricalPlaces = <RwandanHistoricalPlacesModel>[].obs;
  RxList<RwandanHistoricalPlacesModel> rwandanHistoricalPlaces = <RwandanHistoricalPlacesModel>[].obs;
  RxList<RwandanHistoricalPlacesModel> rwandanHistoricalPlace2 = <RwandanHistoricalPlacesModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getRwandanHistroicalPlaces() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<RwandanHistoricalPlacesModel> rwandanHistoricalPlacesResponse = await _databaseService.getRwandanHistoricalPlaces();
      
      print("Rwanda Kings list --->> ${rwandanHistoricalPlacesResponse.length}");

    allRwandanHistoricalPlaces.value = rwandanHistoricalPlacesResponse;
    rwandanHistoricalPlaces.value = rwandanHistoricalPlacesResponse.getRange(0, 4).toList();
    rwandanHistoricalPlaces.shuffle();
    rwandanHistoricalPlace2.value = rwandanHistoricalPlaces;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    rwandanHistoricalPlaces.value = allRwandanHistoricalPlaces.getRange(4, 8).toList();
    rwandanHistoricalPlaces.shuffle();
    rwandanHistoricalPlace2.value = rwandanHistoricalPlaces;
  }

  @override
  void onInit() {
    getRwandanHistroicalPlaces();
    super.onInit();
  }
}
