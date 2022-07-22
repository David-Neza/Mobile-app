import 'package:clds/constants/sizeConfig.dart';
import 'package:clds/controllers/home_dashboard/authentication_controller.dart';
import 'package:clds/controllers/home_dashboard/home_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/text_styles.dart';

class HomeDashboard extends GetWidget<HomeDashboardController> {
   HomeDashboard({Key? key}) : super(key: key);
  final authenticationController = Get.find<AuthenticationController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 8),
        child: Column(
          children: [
            SizedBox(
              height: SizeConfig.heightMultiplier * 4,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: SizeConfig.widthMultiplier * 6,
                  backgroundImage: const AssetImage(Images.flagImage),
                ),
                Text(DateFormat('EEEE, d MMM').format(DateTime.now()),
                    style: TextAppStyles.titleBoldText),
                GestureDetector(
                  onTap: ()=>authenticationController.signOut(),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeConfig.widthMultiplier * 2.5),
                    height: SizeConfig.heightMultiplier * 6,
                    width: SizeConfig.widthMultiplier * 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: greyLight,
                    ),
                    child: SvgPicture.asset(
                      Images.bellIcon,
                      height: SizeConfig.imageSizeMultiplier * 3,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: SizeConfig.heightMultiplier * 2,
            ),
            Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: controller.categories.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 32,
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.4)),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(controller.categories[index].route!),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: whiteColor,
                            border: Border.all(color: blueLight)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: SizeConfig.heightMultiplier * 12,
                              width: SizeConfig.widthMultiplier * 24,
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(
                                        controller.categories[index].image!),
                                    fit: BoxFit.fill),
                                color: blueLight,
                              ),
                            ),
                            Text(
                              controller.categories[index].text1!,
                              style: TextAppStyles.simpleBoldText,
                            ),
                            Text(
                              controller.categories[index].text2!,
                              style: TextAppStyles.simpleMediumText,
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
    );
  }
}
