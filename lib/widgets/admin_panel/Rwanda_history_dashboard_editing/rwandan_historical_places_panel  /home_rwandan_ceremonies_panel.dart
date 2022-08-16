import 'package:clds/constants/colors.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/constants/text_styles.dart';
import 'package:clds/controllers/admin_panel_cotnrollers/admin_panel_controller.dart';
import 'package:clds/routes/route_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeRwandanHistoricalPlacesPanel extends GetWidget<AdminPanelController> {
  const HomeRwandanHistoricalPlacesPanel({Key? key}) : super(key: key);

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
                            child:
                                const Center(child: Icon(Icons.arrow_back_ios)),
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.widthMultiplier * 12,
                        ),
                        Text("Rwandan Historical Places", style: TextAppStyles.dashboardText),
                      ],
                    ),
                    SizedBox(
                      height: SizeConfig.heightMultiplier * 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Places',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Get.toNamed(RouteLinks.homeAddRwandanHistoricalPlacesPanel),
                            child: Text(
                              'Add Place',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '(${controller.rwandanHistoricalPlaces.length})',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 44),
                      child: Divider(
                        thickness: 0.8,
                        color: Colors.black38,
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: controller.rwandanHistoricalPlaces.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.widthMultiplier * 6,
                                    vertical:
                                        SizeConfig.heightMultiplier * 1.2),
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteLinks.homeAddRwandanHistoricalPlacesPanel),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: greyLight,
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Stack(
                                      children: [
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .widthMultiplier *
                                                      6,
                                                  vertical: SizeConfig
                                                          .heightMultiplier *
                                                      1.2),
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      12,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      24,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                              ),
                                              child: Image.network(controller
                                                  .rwandanHistoricalPlaces[index].image!),
                                            ),
                                            SizedBox(
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      6,
                                            ),
                                            Text(
                                                "${controller.rwandanHistoricalPlaces[index].name}",
                                                style: TextAppStyles
                                                    .titleBoldText),       
                                          ],
                                        ),
                                        Positioned(
                                          top:
                                              SizeConfig.heightMultiplier * 1.5,
                                          right: SizeConfig.widthMultiplier * 2,
                                          child: GestureDetector(
                                            onTap: () => controller.deleteRwandanHistoricalPlace(
                                                id: controller
                                                    .rwandanHistoricalPlaces[index].docId!),
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: SizeConfig
                                                          .widthMultiplier *
                                                      2.5),
                                              height:
                                                  SizeConfig.heightMultiplier *
                                                      6,
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      16,
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: white,
                                              ),
                                              child: const Center(
                                                  child: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }))
                  ],
                ))),
      ),
    );
  }
}
