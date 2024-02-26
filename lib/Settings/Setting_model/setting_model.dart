import 'package:flutter/material.dart';

class SettingModel {
  Icon image;
  String discription;
  Color bgcolor;

  SettingModel ({required this.image, required this.discription,required this.bgcolor});
}

List<SettingModel> accountSettings = [
  SettingModel(
    image: Icon(Icons.lock_open_sharp, color: Colors.white,size: 20,),
    discription: "Change Password",
    bgcolor: Color(0xff0EBE7F),
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  SettingModel (

    image: Icon(Icons.notifications,color: Colors.white,size: 20),
    discription: "Notifications",
    bgcolor:Color(0xff56CCF2)
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  SettingModel(
    image: Icon(Icons.area_chart,color: Colors.white,size: 20),
    discription: "Statistics",
    bgcolor:Color(0xffEB5757),
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  SettingModel(
    image: Icon(Icons.info_outlined,color: Colors.white,size: 20),
    discription: "About us",
    bgcolor: Color(0xffF2994A)
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
];