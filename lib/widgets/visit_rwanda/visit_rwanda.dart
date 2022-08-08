import 'package:clds/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/colors.dart';
import '../../constants/sizeConfig.dart';
import 'package:getwidget/getwidget.dart';

class VisitRwanda extends StatelessWidget {
  const VisitRwanda({Key? key}) : super(key: key);

  Widget buildImageCard() => Card(
        color: Colors.black54,
        child: Column(children: [
          Stack(children: [
            Ink.image(
              image: NetworkImage(
                  "https://kaributravelmagazine.com/wp-content/uploads/2020/07/2d65a15a3333bf0d22c27fa7c0ec48f9.jpg"),
              height: 300,
              fit: BoxFit.fill,
            ),
            Text("Ingoro yumwami",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  fontSize: 24,
                ))
          ]),
          SizedBox(height: 8),
          Text(
            "A reconstruction of the traditional royal residence, the King’s Palace is a beautifully-crafted thatched dwelling shaped like a beehive In olden times, Nyanza was the heart of Rwanda. According to oral tradition, it was the site of battles and power struggles For a long time, the monarchy was mobile, moving the court between various locations. When it eventually settled in one place, Nyanza was the obvious choice. The capital of the kingdom had as many as 2,000 inhabitants, and huts built with the same methods as seen here",
            style: TextStyle(fontSize: 14, color: Colors.white),
          )
        ]),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: SizeConfig.widthMultiplier * 4),
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
            Container(
              color: Colors.black45,
            ),
            buildImageCard(),
          ],
        ),
      )),
    );
  }
}
