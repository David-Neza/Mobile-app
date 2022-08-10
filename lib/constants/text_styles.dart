import 'package:clds/constants/colors.dart';
import 'package:clds/constants/sizeConfig.dart';
import 'package:flutter/cupertino.dart';

class TextAppStyles {
  static final titleHyeon = TextStyle(
      fontFamily: 'Muli',
      fontSize: SizeConfig.textMultiplier * 4,
      fontWeight: FontWeight.bold);

  static final simpleMediumText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontWeight: FontWeight.w800,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );

  static final simpleMediumBoldText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontWeight: FontWeight.bold,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );

  static final simpleMediumGreyText = TextStyle(
    fontFamily: 'Muli',
    color: greyColor,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );
  static final simpleBoldText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );

  static final simpleBoldTextGreen = TextStyle(
    fontFamily: 'Muli',
    color: green,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );
  static final simpleBoldTextRed = TextStyle(
    fontFamily: 'Muli',
    color: red,
    fontWeight: FontWeight.w500,
    fontSize: SizeConfig.textMultiplier * 1.5,
  );

  static final titleBoldText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontWeight: FontWeight.w800,
    fontSize: SizeConfig.textMultiplier * 2,
  );

  static final simpleText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontSize: SizeConfig.textMultiplier * 1.5,
    fontWeight: FontWeight.w800,
  );

   static final dashboardText = TextStyle(
    fontFamily: 'Muli',
    color: dashColor,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.textMultiplier * 2,
  );

   static final dashboardSubText = TextStyle(
    fontFamily: 'Muli',
    color: blackColor,
    fontWeight: FontWeight.w600,
    fontSize: SizeConfig.textMultiplier * 1.8,
  );
}
