
import 'package:clds/controllers/rwanda_historical_places_controller%20/rwanda_historical_places_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/shake_widget.dart';
import '../../constants/sizeConfig.dart';
import '../../constants/text_styles.dart';

class RwandanHistoricalPlaces extends GetWidget<RwandanHistoricalPlacesController> {

  Widget buildImageCard() => Card(
    color: readColor,
      child: Column(children: [
        Stack(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.network(
            "${controller.rwandanHistoricalPlace2[controller.selectedUpIndex.value].image}",
            height: 300.0,
            fit: BoxFit.fill,
            ),
          )
      ]),
         Text(
            "${controller.rwandanHistoricalPlace2[controller.selectedUpIndex.value].name}",
            style: TextAppStyles.dashboardText,
          ),
          Expanded(child: 
          Text(
           "${controller.rwandanHistoricalPlace2[controller.selectedUpIndex.value].description}",
           style: TextAppStyles.titleBoldText),         
          ),
        ]),
        
      );


  RwandanHistoricalPlaces({Key? key}) : super(key: key);
  final List<GlobalKey<ShakeWidgetState>> shakeKey =
      List.generate(4, (index) => GlobalKey<ShakeWidgetState>());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 95, 102, 102),
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
                  
                  SizedBox(height: SizeConfig.heightMultiplier * 4),
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
