import 'package:flutter/cupertino.dart';

class UnbordingContent {
  String discription;

  String discription1;

  UnbordingContent({ required this.discription, required this.discription1});
}

List<UnbordingContent> auth = [
  UnbordingContent(
    discription: "Forget Password",
    discription1: "Enter your email for the verification proccesss,we will send 4 digits code to your email.",
  ),
  UnbordingContent(
    discription: "Choose Best Doctors",
    discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
];