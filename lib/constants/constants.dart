import 'dart:math';

import 'package:flutter/material.dart';

class K {


  static const primaryColor =  Color(0xff0EBE7F);
  static const secondaryColor = Color(0xffFA9257);
  static const primaryBG = Color(0xffFFDF9E);
  static const primaryBG2 = Color(0xff121312);

  static const shadowColor = Color(0xffb4d9e0);
  static const appBGColor = Color(0xFFeceef9);
  static const limeColor = Color(0xffCFC706);
  static const yellowColor =Color(0xffFFE800);
  static const buttonColor =Color(0xff530284);
  static const appBGColor2 = Color(0xFFf5f7fb);
  static const appLightColor = Color(0xffd9ddf3);
  static const subTextColor = Color(0xff9595a4);

  static const progressGreenColor = Color(0xff6CCC7E);

  static const fieldBackgroundColor = Color(0xffF6F6F6);
  static const fieldBorderColor = Color(0xffbabcff);


  static const darkTextColor = Color(0xff20263c);

  static List<String> randomImages = [
    'assets/images/bgabovecommon.png',
    'assets/images/bgcommon.png',
  ];
  static late String backgroundImage;
  static void setBackgroundImage() {
    final random = Random();
    final randomIndex = random.nextInt(randomImages.length);
    backgroundImage = randomImages[randomIndex];
    // setState(() {
    //
    // });
  }

}