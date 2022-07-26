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
                  Text("Learn kinyarwanda",
                      style: TextAppStyles.titleBoldText),
                ],
              ),
           Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.learnKinyarwandaPage_1),
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
                                          Images.grammarImage),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Vocabulary & Grammar",
                        style: TextAppStyles.titleBoldText), 
                    ],
                  ),
                ),
              ),

                  SizedBox(
                height: SizeConfig.heightMultiplier * 6,
              ),
                       Container(
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
                                        Images.oderImage),
                                    fit: BoxFit.fill),
                              
                              ),
                            ),
                          SizedBox(width: SizeConfig.widthMultiplier*6,),   
                            Text("Conversation",
                      style: TextAppStyles.titleBoldText), 
                  ],
                ),
              ),

       Spacer(),
            ]),
        ),
      ),
    );
  }
}