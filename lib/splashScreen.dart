import 'dart:async';
import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/Introduction/intro1.dart';
import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// ignore: camel_case_types
class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  _splashScreen createState() => _splashScreen();
}

class _splashScreen extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => (FirebaseAuth.instance.currentUser!=null)?MyHomePage(): const Introduction(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Stack(
        children: [
          Align(
          alignment: Alignment.topLeft,
          child: Image.asset("assets/images/bgabovecommon.png",),
        ),
          Align(
          alignment: Alignment.center,
          child: Image.asset("assets/images/applogo.png",),
        ),
          Align(
          alignment: Alignment.bottomRight,
          child: Image.asset("assets/images/bgcommon.png",),
        ),
        ],
      ),
    );
  }

}