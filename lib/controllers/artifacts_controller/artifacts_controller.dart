// ignore_for_file: unnecessary_new

import 'dart:math';

import 'package:clds/models/artifacts_model.dart';
import 'package:clds/services/database.dart';
import 'package:get/get.dart';


class ArtifactsController extends GetxController {
  RxList<ArtifactsModel> allArtifacts = <ArtifactsModel>[].obs;
  RxList<ArtifactsModel> artifacts = <ArtifactsModel>[].obs;
  RxList<ArtifactsModel> artifact2 = <ArtifactsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;

  final _databaseService = DatabaseService();

  void getArtifacts() async {
    Random random = new Random();
    int randomNumber = random.nextInt(4);
    selectedUpIndex.value = randomNumber;

  // getIbisakuzo() async{
  //   var response = await _databaseService.getIbisakuzo();
  //   print("ibisakuzo byacu ${response.length}");
  // }

    List<ArtifactsModel> artifactsResponse = await _databaseService.getArtifacts();
      
      print("artifacts --->> ${artifactsResponse.length}");

    allArtifacts.value = artifactsResponse;
    artifacts.value = artifactsResponse.getRange(0, 3).toList();
    artifacts.shuffle();
    artifact2.value = artifacts;
  }

  void changeList() {
     Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    artifacts.value = allArtifacts.getRange(4, 8).toList();
    artifacts.shuffle();
    artifact2.value = artifacts;
  }

  @override
  void onInit() {
    getArtifacts();
    super.onInit();
  }
}
