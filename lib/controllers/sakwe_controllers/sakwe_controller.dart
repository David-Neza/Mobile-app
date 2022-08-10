// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:clds/models/game_models.dart';
import 'package:clds/models/ibisakuzo_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';

import '../../utils/game_questoin.dart';

class SakweController extends GetxController {
  RxList<IbisakuzoModel> allSakwes = <IbisakuzoModel>[].obs;
  RxList<IbisakuzoModel> sakwes = <IbisakuzoModel>[].obs;
  RxList<IbisakuzoModel> sakwe2 = <IbisakuzoModel>[].obs;
  RxInt selectedUpIndex = 0.obs;

  final _databaseService = DatabaseService();

  void getSakwes() async {
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<IbisakuzoModel> ibisakuzoResponse = await _databaseService.getIbisakuzo();
      
      print("ibisakuzo --->> ${ibisakuzoResponse.length}");

    allSakwes.value = ibisakuzoResponse;
    sakwes.value = ibisakuzoResponse.getRange(0, 3).toList();
    sakwes.shuffle();
    sakwe2.value = sakwes;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    sakwes.value = allSakwes.getRange(4, 8).toList();
    sakwes.shuffle();
    sakwe2.value = sakwes;
  }

  @override
  void onInit() {
    getSakwes();
    super.onInit();
  }
}
