import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizeConfig.dart';
import '../../../constants/text_styles.dart';
import '../../../controllers/admin_panel_cotnrollers/admin_panel_controller.dart';
import '../../../routes/route_link.dart';

class HomeGreetingPanel extends GetWidget<AdminPanelController> {
  const HomeGreetingPanel({Key? key}) : super(key: key);

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
                        Text("Greetings Panel", style: TextAppStyles.dashboardText),
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
                            'Greetings',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () =>
                                Get.toNamed(RouteLinks.homeAddGreetingsPanel),
                            child: Text(
                              'Add Greeting',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            '(${controller.greetings.length})',
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
                            itemCount: controller.greetings.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: SizeConfig.widthMultiplier * 6,
                                    vertical:
                                        SizeConfig.heightMultiplier * 1.2),
                                child: GestureDetector(
                                  onTap: () =>
                                      Get.toNamed(RouteLinks.homeGreetingsPanel),
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
                                            ),
                                            SizedBox(
                                              width:
                                                  SizeConfig.widthMultiplier *
                                                      6,
                                            ),
                                            Text(
                                                "${controller.greetings[index].textKinyarwanda}",
                                                style: TextAppStyles
                                                    .titleBoldText),
                                          ],
                                        ),
                                        Positioned(
                                          top:
                                              SizeConfig.heightMultiplier * 1.5,
                                          right: SizeConfig.widthMultiplier * 2,
                                          child: GestureDetector(
                                            onTap: () => controller.deleteGreeting(
                                                id: controller
                                                    .greetings[index].docId!),
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
