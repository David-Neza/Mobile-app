// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:clds/models/game_models.dart';
import 'package:clds/models/greetings_modal.dart';
import 'package:clds/models/ibisakuzo_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';

import '../../utils/game_questoin.dart';

class GreetingsController extends GetxController {
  RxList<GreetingsModel> allGreetings = <GreetingsModel>[].obs;
  RxList<GreetingsModel> greetings= <GreetingsModel>[].obs;
  RxList<GreetingsModel> greeting2 = <GreetingsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;

  final _databaseService = DatabaseService();

  void getGreetings() async {
    isLoading.value = true;
   
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<GreetingsModel> greetingsResponse = await _databaseService.getGreetings();
      
      print("greetings // --->> ${greetingsResponse.length}");

    allGreetings.value = greetingsResponse;
    greetings.value = greetingsResponse.getRange(0, 3).toList();
    greetings.shuffle();
    greeting2.value = greetings;

     isLoading.value = false;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;
    greetings.value = allGreetings.getRange(4, 8).toList();
    greetings.shuffle();
    greeting2.value = greetings;
  }

  @override
  void onInit() {
    getGreetings();
    super.onInit();
  }
}
