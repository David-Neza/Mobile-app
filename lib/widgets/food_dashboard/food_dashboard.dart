
import 'package:clds/controllers/food_dashboard_controller/food_dashboard_controller.dart';
import 'package:clds/controllers/home_dashboard/home_dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clds/constants/images.dart';

import '../../constants/colors.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';


class FoodDashboard extends StatelessWidget {
  const FoodDashboard({ Key? key }) : super(key: key);

  static const List foodCategoriesList = [
  {
    "image": Images.inkinyImage,
    "text_1": "Isombe",
    "text_2": "Learn",
    "route": ""
  },
  {
    "image": Images.inkonoImage,
    "text_1": "Imvange",
    "text_2": "pots,baskets ..",
    "route": ""
  },
  {
    "image": Images.danceImage,
    "text_1": "Dancing",
    "text_2": "Guhamiriza",
    "route": ""
  },
  {
    "image": Images.ibihazaImage,
    "text_1": "Rwandan Foods",
    "text_2": "Recipes",
    "route": ""
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*4),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              SizedBox(height: SizeConfig.heightMultiplier*4,),
                    Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                        GestureDetector(
                      onTap: ()=>Get.back(),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.widthMultiplier * 2.5),
                        height: SizeConfig.heightMultiplier * 6,
                        width: SizeConfig.widthMultiplier * 16,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: greyLight,
                        ),
                        child:const Center(child:  Icon(Icons.arrow_back_ios)),
                      ),
                    ),
            SizedBox(width: SizeConfig.widthMultiplier*12,),
                  Text("Rwandan Foods",
                      style: TextAppStyles.titleBoldText),
                ],
              ),
              Expanded(
              child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: foodCategoriesList.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 24,
                      crossAxisSpacing: 32,
                      crossAxisCount: 2,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.4)),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () =>
                          Get.toNamed(foodCategoriesList[index].route!),
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
                                        foodCategoriesList[index].image!),
                                    fit: BoxFit.fill),
                                color: blueLight,
                              ),
                            ),
                            Text(
                              foodCategoriesList[index].text1!,
                              style: TextAppStyles.simpleBoldText,
                            ),
                            Text(
                              foodCategoriesList[index].text2!,
                              style: TextAppStyles.simpleMediumText,
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            )
            ]),
        ),
      ),
    );
  }
}