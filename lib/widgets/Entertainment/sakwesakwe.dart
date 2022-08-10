// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:clds/controllers/sakwe_controllers/sakwe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';
import '../../controllers/gmae_controllers/game_controller.dart';

class SakweSakwe extends GetWidget<SakweController> {
  SakweSakwe({Key? key}) : super(key: key);
  final List<GlobalKey<ShakeWidgetState>> shakeKey =
      List.generate(4, (index) => GlobalKey<ShakeWidgetState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => SafeArea(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
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
              child: Text("Choos the right match for ",
                  style: TextAppStyles.simpleMediumBoldText),
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Center(
              child: Text(
                  "${controller.sakwe2[controller.selectedUpIndex.value].question}",
                  style: TextAppStyles.titleBoldText),
            ),
            SizedBox(height: SizeConfig.heightMultiplier * 4),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 8),
              child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: controller.sakwes.length,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: SizeConfig.heightMultiplier * 4,
                      crossAxisSpacing: SizeConfig.heightMultiplier * 4,
                      crossAxisCount: 2,
                      mainAxisExtent: SizeConfig.heightMultiplier * 18),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.sakwes[index].id !=
                            controller
                                .sakwe2[controller.selectedUpIndex.value].id) {
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
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  top: SizeConfig.heightMultiplier * 0.1,
                                  left: SizeConfig.heightMultiplier * 0.1,
                                  right: SizeConfig.heightMultiplier * 0.1,
                                  bottom: SizeConfig.heightMultiplier * 0.8),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: whiteColor,
                                  border: Border.all(color: greyLight),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                ),
                                child: Center(
                                  child:controller.sakwes[index].answer1!.isEmpty?
                                  Text(
                  "${controller.sakwes[index].answer2}",
                  style: TextAppStyles.titleBoldText)
                                  : Text(
                                    controller.sakwes[index].correct_answer!,
                                   
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
