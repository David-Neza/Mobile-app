import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors.dart';
import '../../../constants/sizeConfig.dart';
import '../../../constants/text_styles.dart';
import '../../../controllers/admin_panel_cotnrollers/admin_panel_controller.dart';

class HomeAddArtifactPanel extends GetWidget<AdminPanelController> {
  HomeAddArtifactPanel({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Obx(
        () => Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
          child: Form(
            key: _formKey,
            child: SafeArea(
                child: ListView(
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
                    Text("Add Artifact", style: TextAppStyles.titleBoldText),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Text(
                  "Name",
                  style: TextAppStyles.simpleMediumText,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.2,
                ),
                TextFormField(
                  controller: controller.name.value,
                  keyboardType: TextInputType.name,
                  validator: (value) => controller.name.value.text.isEmpty
                      ? "Insert Name "
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: blueLight,
                    filled: true,
                    hintText: "Enter name",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Muli",
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Text(
                  "Image Link",
                  style: TextAppStyles.simpleMediumText,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.2,
                ),
                TextFormField(
                  controller: controller.imageLink.value,
                  keyboardType: TextInputType.name,
                  validator: (value) => controller.imageLink.value.text.isEmpty
                      ? "Insert Image Link "
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: blueLight,
                    filled: true,
                    hintText: "INsert Image Link",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Muli",
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                Text(
                  "Description",
                  style: TextAppStyles.simpleMediumText,
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 1.2,
                ),
                TextFormField(
                  controller: controller.description.value,
                  keyboardType: TextInputType.name,
                  validator: (value) => controller.description.value.text.isEmpty
                      ? "Insert description"
                      : null,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    fillColor: blueLight,
                    filled: true,
                    hintText: "Insert description",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Muli",
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.heightMultiplier * 3,
                ),
                controller.isArtifactSubmit.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Center(
                        child: Container(
                          width: size.width * 0.9,
                          height: size.height * 0.07,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.black)),
                              child: const Text('Add Artifact'),
                              onPressed: () =>
                                  controller.submitArtifact(key: _formKey)),
                        ),
                      ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
