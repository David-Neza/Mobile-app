// ignore_for_file: prefer_const_constructors, unnecessary_new


import 'package:clds/controllers/artifacts_controller/artifacts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class HistoricalArtifacts extends GetWidget<ArtifactsController> {

  static const ikibindiDescription = "Rwandan traditional tool to keep of fetch water or make traditional beer ( Ikigage)";
  static const agasekeDescription = "Agaseke is a hand-woven basket made from and sisal plant, “imigwegwe” (sweetgrass), or even papyrus. Requiring a lot of precision and patience, these baskets are traditionally made by women and have been part of the Rwandan culture for centuries";

  Widget buildImageCard() => Card(
        color: readColor,
        child: Column(children: [
          Stack(children: [
            ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: Image.network(
        "${controller.artifact2[controller.selectedUpIndex.value].image}",
        height: 400.0,
    ),
    )
          ]),
         Text(
            "${controller.artifact2[controller.selectedUpIndex.value].text}",
            style: TextAppStyles.dashboardText,
          ),
            new Expanded(
        flex: 1,
        child: new SingleChildScrollView( 
          scrollDirection: Axis.vertical,
        child: Column(
          children: [
        
              Padding(padding: EdgeInsets.all(10),
              child: Text(
                        "",
                style: TextAppStyles.titleBoldText),         
              ),
         ]),
          ),
      ),]
      )        
        //   Expanded(child: 
        //   Text(
        //     "A reconstruction of the traditional royal residence, the King’s Palace is a beautifully-crafted thatched dwelling shaped like a beehive In olden times, Nyanza was the heart of Rwanda. According to oral tradition, it was the site of battles and power struggles For a long time, the monarchy was mobile, moving the court between various locations. When it eventually settled in one place, Nyanza was the obvious choice. The capital of the kingdom had as many as 2,000 inhabitants, and huts built with the same methods as seen here",
        //     style: TextAppStyles.titleBoldText), 
        //   ),         
        // ]),
        
      );


  HistoricalArtifacts({Key? key}) : super(key: key);
  final List<GlobalKey<ShakeWidgetState>> shakeKey =
      List.generate(4, (index) => GlobalKey<ShakeWidgetState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => controller.isLoading.value
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.widthMultiplier * 4),
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
                   Expanded(child:
                  buildImageCard(),
                  ),
                   Container(
                    child: ElevatedButton(
                      style: ButtonStyle(
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.black)),
                        child: const Text('Next'),
                        onPressed: () =>{ controller.changeList()}
                  ),
                ),
                ],
              ),
            )),
    ));
  }
}
