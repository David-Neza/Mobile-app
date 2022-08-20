// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:clds/controllers/fruits_controller/fruits_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class LearnFruits extends GetWidget<FruitsController> {
  LearnFruits({Key? key}) : super(key: key);

  final player = AudioPlayer();
  // final List<GlobalKey<ShakeWidgetState>> shakeKey =
  //     List.generate(4, (index) => GlobalKey<ShakeWidgetState>());
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
                    Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
            width: SizeConfig.widthMultiplier * 12,
          ),
          Text("Fruits", style: TextAppStyles.dashboardText),
            ],
          ),
                  SizedBox(
                    height: SizeConfig.heightMultiplier * 4,
                  ),
                 
                 SizedBox(
                    height: SizeConfig.heightMultiplier * 2,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "${controller.fruit2[controller.selectedUpIndex.value].text}",
                          style: TextAppStyles.titleBoldText),
                      SizedBox(
                        width: SizeConfig.heightMultiplier * 2,
                      ),
                      IconButton(
                          onPressed: () async {
                            await player.setUrl(controller
                                .fruit2[controller.selectedUpIndex.value]
                                .audio!);
                            await player.play();
                          },
                          icon: Icon(Icons.volume_up))
                    ],
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 8),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.fruits.length,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate:
                            new SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing:
                                    SizeConfig.heightMultiplier * 4,
                                crossAxisSpacing:
                                    SizeConfig.heightMultiplier * 4,
                                crossAxisCount: 2,
                                mainAxisExtent:
                                    SizeConfig.heightMultiplier * 18),
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              if (controller.fruits[index].text !=
                                  controller
                                      .fruit2[controller.selectedUpIndex.value]
                                      .text) {
                                Get.snackbar('oohps', 'try again',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 1),
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    margin: EdgeInsets.all(10));
                                return controller.shakeKey[index].currentState
                                    ?.shake();
                              } else {
                                Get.snackbar('wow nice', 'proceed',
                                    snackPosition: SnackPosition.BOTTOM,
                                    duration: Duration(seconds: 1),
                                    backgroundColor: Colors.green,
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    margin: EdgeInsets.all(10));
                                controller.changeList();
                              }
                            },
                            child: ShakeWidget(
                              key: controller.shakeKey[index],
                              shakeCount: 3,
                              shakeOffset: 10,
                              shakeDuration: Duration(milliseconds: 500),
                              child: Stack(
                                clipBehavior: Clip.antiAlias,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        //  shape: BoxShape.circle, border: Border.all(color: grey)),
                                        color: greyLight,
                                        border: Border.all(color: whiteColor),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeConfig.heightMultiplier * 0.1,
                                        left: SizeConfig.heightMultiplier * 0.1,
                                        right:
                                            SizeConfig.heightMultiplier * 0.1,
                                        bottom:
                                            SizeConfig.heightMultiplier * 0.8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: whiteColor,
                                        border: Border.all(color: greyLight),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20)),
                                      ),
                                      child: Center(
                                        child: Image.network(
                                          controller.fruits[index].image!,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  )
                ],
              ),
            )),
    ));
  }
}
