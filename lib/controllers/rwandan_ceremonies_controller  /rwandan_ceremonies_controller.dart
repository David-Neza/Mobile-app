// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/rwandan_ceremonies_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class RwandanCeremoniesController extends GetxController {
  RxList<RwandanCeremoniesModel> allRwandanCeremonies = <RwandanCeremoniesModel>[].obs;
  RxList<RwandanCeremoniesModel> rwandanCeremonies = <RwandanCeremoniesModel>[].obs;
  RxList<RwandanCeremoniesModel> rwandanCeremony2 = <RwandanCeremoniesModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;


  final _databaseService = DatabaseService();

  void getRwandanCeremonies() async {
    isLoading.value = true;
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<RwandanCeremoniesModel> rwandanCeremoniesResponse = await _databaseService.getRwandanCeremonies();
      
      print("Rwandan Ceremonies list --->> ${rwandanCeremoniesResponse.length}");

    allRwandanCeremonies.value = rwandanCeremoniesResponse;
    rwandanCeremonies.value = rwandanCeremoniesResponse.getRange(0, 4).toList();
    rwandanCeremonies.shuffle();
    rwandanCeremony2.value = rwandanCeremonies;
      isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    rwandanCeremonies.value = allRwandanCeremonies.getRange(4, 8).toList();
    rwandanCeremonies.shuffle();
    rwandanCeremony2.value = rwandanCeremonies;
  }

  @override
  void onInit() {
    getRwandanCeremonies();
    super.onInit();
  }
}
