// ignore_for_file: unnecessary_new

import 'dart:math';
import 'package:clds/models/tools_model.dart';
import 'package:clds/services/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/shake_widget.dart';

class ToolsController extends GetxController {
  RxList<ToolsModel> allTools = <ToolsModel>[].obs;
  RxList<ToolsModel> tools = <ToolsModel>[].obs;
  RxList<ToolsModel> tool2 = <ToolsModel>[].obs;
  RxInt selectedUpIndex = 0.obs;
  RxBool isLoading = false.obs;
  RxList<GlobalKey<ShakeWidgetState>> shakeKey =
      <GlobalKey<ShakeWidgetState>>[].obs;

  final _databaseService = DatabaseService();

  void getTools() async {
    isLoading.value = true;

    // getIbisakuzo() async{
    //   var response = await _databaseService.getIbisakuzo();
    //   print("ibisakuzo byacu ${response.length}");
    // }

    List<ToolsModel> toolsResponse = await _databaseService.getTools();
    print("tools length =========> ${toolsResponse.length}");
    allTools.value = toolsResponse;
    tools.value = toolsResponse.getRange(0, 4).toList();
    tools.shuffle();
    tool2.value = tools;

    shakeKey.value =
        List.generate(tools.length, (index) => GlobalKey<ShakeWidgetState>());

    Random random = new Random();
    int randomNumber = random.nextInt(tools.length);
    selectedUpIndex.value = randomNumber;

    isLoading.value = false;
  }

  void changeList() {
    Random random = new Random();
    int randomNumber = random.nextInt(3);
    selectedUpIndex.value = randomNumber;
    allTools.shuffle();
    tools.value = allTools.getRange(4, 8).toList();
    tools.shuffle();
    tool2.value = tools;
  }

  @override
  void onInit() {
    getTools();
    super.onInit();
  }
}
