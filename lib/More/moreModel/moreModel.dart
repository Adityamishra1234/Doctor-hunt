import 'package:flutter/material.dart';

class MoreModel {
  Icon image;
  String discription;

  MoreModel ({required this.image, required this.discription,});
}

List<MoreModel> morebar = [
  // MoreModel (
  //   image: Icon(Icons.person_pin, color: Color(0xff0EBE7F),),
  //   discription: "Your Profile",
  //   // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  // ),
  MoreModel (
    image: Icon(Icons.health_and_safety_outlined,color: Color(0xff0EBE7F)),
    discription: "My Doctors",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image: Icon(Icons.menu_book_sharp,color: Color(0xff0EBE7F)),
    discription: "Medical Records",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image: Icon(Icons.payment,color: Color(0xff0EBE7F)),
    discription: "Payments",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image: Icon(Icons.card_travel,color: Color(0xff0EBE7F)),
    discription: "Medicine Orders",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image: Icon(Icons.calendar_month,color: Color(0xff0EBE7F)),
    discription: "Test Bookings",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image:Icon(Icons.policy,color: Color(0xff0EBE7F)),
    discription: "Help Center",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image: Icon(Icons.help,color: Color(0xff0EBE7F)),
    discription: "Settings",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
  MoreModel (
    image:Icon(Icons.logout,color: Color(0xff0EBE7F)),
    discription: "Logout",
    // discription1: "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of it over 2000 years old.",
  ),
];