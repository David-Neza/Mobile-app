// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:clds/models/game_models.dart';
import 'package:get/get.dart';

import '../../utils/game_questoin.dart';

class GameController extends GetxController {
  RxList<GameModel> allGames = <GameModel>[].obs;
  RxList<GameModel> games = <GameModel>[].obs;
  RxList<GameModel> games2 = <GameModel>[].obs;
  RxInt selectedUpIndex = 0.obs;

  void getGames() async {
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;
    List<GameModel> gamesResponse =
        gamesQuestionList.map((item) => GameModel.fromJson(item)).toList();
    allGames.value = gamesResponse;
    games.value = gamesResponse.getRange(0, 4).toList();
    games.shuffle();
    games2.value = games;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;
    games.value = allGames.getRange(4, 8).toList();
    games.shuffle();
    games2.value = games;
  }

  @override
  void onInit() {
    getGames();
    super.onInit();
  }
}
