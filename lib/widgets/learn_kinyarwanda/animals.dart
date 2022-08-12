// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:clds/controllers/animals_controller%20/animals_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class LearnAnimals extends GetWidget<AnimalsController> {
  LearnAnimals({Key? key}) : super(key: key);
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
                        "${controller.animal2[controller.selectedUpIndex.value].text}",
                        style: TextAppStyles.titleBoldText),
                  ),
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 8),
                    child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: controller.animals.length,
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
                              if (controller.animals[index].text !=
                                  controller
                                      .animal2[controller.selectedUpIndex.value]
                                      .text) {
                                Get.snackbar('oohps', 'try again',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: Colors.red,
                                    duration: Duration(seconds: 1),
                                    colorText: Colors.white,
                                    borderRadius: 10,
                                    margin: EdgeInsets.all(10));
                                return shakeKey[index].currentState?.shake();
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
                              key: shakeKey[index],
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
                                          controller.animals[index].image!,
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
