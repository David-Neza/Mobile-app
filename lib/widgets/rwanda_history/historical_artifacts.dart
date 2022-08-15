// ignore_for_file: prefer_const_constructors, unnecessary_new


import 'package:clds/controllers/artifacts_controller/artifacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class HistoricalArtifacts extends GetWidget<ArtifactsController> {

  Widget buildImageCard() => Card(
        color: readColor,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Image.network(
        "${controller.artifact2[controller.selectedUpIndex.value].image}",
        height: 200.0,
        width: 500.0,
    ),
    )
          ]),
         Text(
            "${controller.artifact2[controller.selectedUpIndex.value].text}",
            style: TextAppStyles.dashboardText,
          ),
          Text(
            "A reconstruction of the traditional royal residence, the King’s Palace is a beautifully-crafted thatched dwelling shaped like a beehive In olden times, Nyanza was the heart of Rwanda. According to oral tradition, it was the site of battles and power struggles For a long time, the monarchy was mobile, moving the court between various locations. When it eventually settled in one place, Nyanza was the obvious choice. The capital of the kingdom had as many as 2,000 inhabitants, and huts built with the same methods as seen here",
            style: TextAppStyles.titleBoldText),         
        ]),
        
      );


  HistoricalArtifacts({Key? key}) : super(key: key);
  final List<GlobalKey<ShakeWidgetState>> shakeKey =
      List.generate(4, (index) => GlobalKey<ShakeWidgetState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  GestureDetector(
                    onTap: () => Get.back(),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiplier * 2.5),
                      height: SizeConfig.heightMultiplier * 6,
                      width: SizeConfig.widthMultiplier * 16,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: greyLight,
                      ),
                      child: const Center(child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                  Center(
                    child: Text("Choose the right match for ",
                        style: TextAppStyles.dashboardText),
                  ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Center(
                    child: Text(
                        "${controller.artifact2[controller.selectedUpIndex.value].text}",
                        style: TextAppStyles.titleBoldText),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
                  buildImageCard(),
                ],
              ),
            )),
    ));
  }
}
