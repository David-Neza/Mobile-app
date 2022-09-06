// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:clds/controllers/dancing_dashboard_controller%20/dancing_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class DancingDashboard extends GetWidget<DancingDashboardController> {
  const DancingDashboard({Key? key}) : super(key: key);
  // final _foodController = Get.find<FoodDashboardController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
              child: SafeArea(
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
                              child: const Center(
                                  child: Icon(Icons.arrow_back_ios)),
                            ),
                          ),
                          SizedBox(
                            width: SizeConfig.widthMultiplier * 12,
                          ),
                          Text("Rwandan Traditional Dance",
                              style: TextAppStyles.dashboardText),
                        ],
                      ),
                       SizedBox(
                            height: SizeConfig.heightMultiplier * 4,
                          ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onTap: () => Get.toNamed(
                                      controller.categories[index].route!),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyLight,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal:
                                                  SizeConfig.widthMultiplier *
                                                      6,
                                              vertical:
                                                  SizeConfig.heightMultiplier *
                                                      1.2),
                                          height:
                                              SizeConfig.heightMultiplier * 12,
                                          width:
                                              SizeConfig.widthMultiplier * 24,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(controller
                                                    .categories[index].image!),
                                                fit: BoxFit.fill),
                                          ),
                                        ),
                                        SizedBox(
                                          width: SizeConfig.widthMultiplier * 6,
                                        ),
                                        SizedBox(
                                          width:
                                              SizeConfig.widthMultiplier * 34,
                                          child: Text(
                                              "${controller.categories[index].text1!} ${controller.categories[index].text2!}",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style:
                                                  TextAppStyles.titleBoldText),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      )
                      // Expanded(
                      //   child: GridView.builder(
                      //       shrinkWrap: true,
                      //       scrollDirection: Axis.vertical,
                      //       itemCount: controller.categories.length,
                      //       gridDelegate:
                      //           new SliverGridDelegateWithFixedCrossAxisCount(
                      //               mainAxisSpacing: 24,
                      //               crossAxisSpacing: 32,
                      //               crossAxisCount: 2,
                      //               childAspectRatio: MediaQuery.of(context)
                      //                       .size
                      //                       .width /
                      //                   (MediaQuery.of(context).size.height /
                      //                       1.4)),
                      //       itemBuilder: (context, index) {
                      //         return GestureDetector(
                      //           // onTap: () =>
                      //           //     Get.toNamed(foodCategoriesList[index].route!),
                      //           child: Container(
                      //             padding: const EdgeInsets.all(15),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(24),
                      //                 color: whiteColor,
                      //                 border: Border.all(color: blueLight)),
                      //             child: Column(
                      //               crossAxisAlignment:
                      //                   CrossAxisAlignment.center,
                      //               mainAxisAlignment:
                      //                   MainAxisAlignment.spaceBetween,
                      //               children: [
                      //                 Container(
                      //                   height:
                      //                       SizeConfig.heightMultiplier * 12,
                      //                   width: SizeConfig.widthMultiplier * 24,
                      //                   padding: const EdgeInsets.all(8),
                      //                   decoration: BoxDecoration(
                      //                     shape: BoxShape.circle,
                      //                     image: DecorationImage(
                      //                         image: AssetImage(controller
                      //                             .categories[index].image!),
                      //                         fit: BoxFit.fill),
                      //                     color: blueLight,
                      //                   ),
                      //                 ),
                      //                 Text(
                      //                   controller.categories[index].text1!,
                      //                   style: TextAppStyles.simpleBoldText,
                      //                 ),
                      //                 Text(
                      //                   controller.categories[index].text2!,
                      //                   style: TextAppStyles.simpleMediumText,
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //         );
                      //       }),
                      // )
                    ]),
              ),
            ),
    ));
  }
}
