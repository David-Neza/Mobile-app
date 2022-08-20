import 'package:clds/routes/route_link.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../constants/images.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';


class RwandaHistory extends StatelessWidget {
  const RwandaHistory ({ Key? key }) : super(key: key);

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
                  Text("Rwandan History",
                      style: TextAppStyles.dashboardText),
                ],
              ),
             Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.rwandaKings),
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
                                          Images.king),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Kings of Rwanda",
                        style: TextAppStyles.titleBoldText), 
                    ],
                  ),
                ),
              ),

           Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.rwandanCeremonies),
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
                                          Images.ubukwe),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Ceremonies",
                        style: TextAppStyles.titleBoldText), 
                    ],
                  ),
                ),
              ),
              
            Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.historicalArtifacts),
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
                                          Images.ubwato),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Historical Artifacts",
                        style: TextAppStyles.titleBoldText), 
                    ],
                  ),
                ),
              ),
                  Spacer(),
              GestureDetector(
                onTap: ()=>Get.toNamed(RouteLinks.rwandanHistoricalPlaces),
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
                                          Images.ingoro),
                                      fit: BoxFit.fill),
                                
                                ),
                              ),
                            SizedBox(width: SizeConfig.widthMultiplier*6,),   
                              Text("Historical Places",
                        style: TextAppStyles.titleBoldText), 
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