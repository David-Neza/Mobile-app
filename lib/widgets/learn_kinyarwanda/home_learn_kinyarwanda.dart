import 'package:clds/routes/route_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';


class HomeLearnKinyarwanda extends StatelessWidget {
  const HomeLearnKinyarwanda({ Key? key }) : super(key: key);

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
                  Text("Learn Kinyarwanda",
                      style: TextAppStyles.dashboardText),
                ],
              ),
           Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.greetings),
                child: Container(
                  decoration: BoxDecoration(
                 color: greyLight,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*6,vertical: SizeConfig.heightMultiplier*1.2),
                                height: SizeConfig.heightMultiplier * 12,
                                width: SizeConfig.widthMultiplier * 24,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Images.greeting),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Greetings",
                        style: TextAppStyles.menuText), 
                    ],
                  ),
                ),
              ),
              
            Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.learnFoods),
                child: Container(
                  decoration: BoxDecoration(
                 color: greyLight,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*6,vertical: SizeConfig.heightMultiplier*1.2),
                                height: SizeConfig.heightMultiplier * 12,
                                width: SizeConfig.widthMultiplier * 24,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Images.tastyChicken),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Meals",
                        style: TextAppStyles.menuText), 
                    ],
                  ),
                ),
              ),
                  Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.learnAnimals),
                child: Container(
                  decoration: BoxDecoration(
                 color: greyLight,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*6,vertical: SizeConfig.heightMultiplier*1.2),
                                height: SizeConfig.heightMultiplier * 12,
                                width: SizeConfig.widthMultiplier * 24,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Images.dog),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Animals",
                        style: TextAppStyles.menuText), 
                    ],
                  ),
                ),
              ),
               SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.learnFruits),
                child: Container(
                  decoration: BoxDecoration(
                 color: greyLight,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*6,vertical: SizeConfig.heightMultiplier*1.2),
                                height: SizeConfig.heightMultiplier * 12,
                                width: SizeConfig.widthMultiplier * 24,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Images.inanasi),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Fruits",
                        style: TextAppStyles.menuText), 
                    ],
                  ),
                ),
              ),

               SizedBox(
                height: SizeConfig.heightMultiplier * 2,
              ),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.learnTools),
                child: Container(
                  decoration: BoxDecoration(
                 color: greyLight,
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier*6,vertical: SizeConfig.heightMultiplier*1.2),
                                height: SizeConfig.heightMultiplier * 12,
                                width: SizeConfig.widthMultiplier * 24,
                                decoration:const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          Images.plate),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Tools",
                        style: TextAppStyles.menuText), 
                    ],
                  ),
                ),
              ),

       Spacer(),
            ]),
        ),
      ),
    );
  }
}