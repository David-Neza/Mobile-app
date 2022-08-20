// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/rwanda_kings_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class RwandaKingsController extends GetxController {
  RxList<RwandaKingsModel> allRwandaKings = <RwandaKingsModel>[].obs;
  RxList<RwandaKingsModel> rwandaKings = <RwandaKingsModel>[].obs;
  RxList<RwandaKingsModel> rwandaKing2 = <RwandaKingsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getRwandaKings() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<RwandaKingsModel> rwandaKingsResponse = await _databaseService.getRwandaKings();
      
      print("Rwanda Kings list --->> ${rwandaKingsResponse.length}");

    allRwandaKings.value = rwandaKingsResponse;
    rwandaKings.value = rwandaKingsResponse.getRange(0, 4).toList();
    rwandaKings.shuffle();
    rwandaKing2.value = rwandaKings;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    rwandaKings.value = allRwandaKings.getRange(4, 8).toList();
    rwandaKings.shuffle();
    rwandaKing2.value = rwandaKings;
  }

  @override
  void onInit() {
    getRwandaKings();
    super.onInit();
  }
}
