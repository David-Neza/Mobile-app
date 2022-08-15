import 'package:clds/constants/colors.dart';
import 'package:clds/constants/images.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/constants/text_styles.dart';
import 'package:clds/controllers/admin_panel_cotnrollers/admin_panel_controller.dart';
import 'package:clds/routes/route_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RwandaHistoryDashboard extends GetWidget<AdminPanelController> {
  const RwandaHistoryDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
      child: SafeArea(
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
                  child: const Center(child: Icon(Icons.arrow_back_ios)),
                ),
              ),
              SizedBox(
                width: SizeConfig.widthMultiplier * 12,
              ),
              Text("Rwanda History", style: TextAppStyles.dashboardText),
            ],
          ),
          
          SizedBox(
            height: SizeConfig.heightMultiplier * 2,
          ),
          
          GestureDetector(
            onTap: () => Get.toNamed(RouteLinks.homeRwandaKingPanel),
            child: Container(
              decoration: BoxDecoration(
                  color: greyLight, borderRadius: BorderRadius.circular(8)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 6,
                        vertical: SizeConfig.heightMultiplier * 1.2),
                    height: SizeConfig.heightMultiplier * 12,
                    width: SizeConfig.widthMultiplier * 24,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage(Images.king),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.widthMultiplier * 6,
                  ),
                  Text("Rwandan Kings", style: TextAppStyles.titleBoldText),
                  
                ],
              ),
            ),
          ),
        ],
      ))),
    ));
  }
}
