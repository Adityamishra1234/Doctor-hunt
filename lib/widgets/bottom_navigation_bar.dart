import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doctor_hunt/All_Doctors/doctors.dart';
import 'package:doctor_hunt/Chat/Chat_main_screen.dart';
import 'package:doctor_hunt/Community/Community_main_screen.dart';
import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/More/moreBar.dart';
import 'package:doctor_hunt/auth/login.dart';
import 'package:doctor_hunt/auth/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/constants.dart';

class MyHomePage extends StatefulWidget {
  final String? name;
  MyHomePage({Key? key, this.name}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late List<Widget> _pages;


  @override
  void initState() {
    var name = widget.name;
    _pages = [
      PageOne(name: name),
      PageTwo(),
      PageThree(),
      PageFour(),
      PageFive(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Exit"),
                content: const Text("Are you sure you want to Exit?"),
                actions: [
                  TextButton(
                    onPressed: () => SystemChannels.platform
                        .invokeMethod('SystemNavigator.pop'),
                    child: const Text(
                      "Yes",
                      style: TextStyle(
                          color: K.primaryColor,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    child: const Text(
                      "No",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              );
            });
        return false;
      },
      child: Container(
        color: Colors.black,
        child: SafeArea(
          top: false,
          child: Scaffold(
            // extendBody: true,
            appBar: null,
            body: _pages[_currentIndex],
            bottomNavigationBar: CurvedNavigationBar(
              backgroundColor: Colors.transparent,
              color: K.primaryColor,
              height: 70,
              index: _currentIndex,
              onTap: (index)=>setState(() {
                this._currentIndex = index;
              }),
              items: [
                Icon(Icons.home, color: Colors.white),
                Icon(Icons.favorite, color: Colors.white),
                Image.asset("assets/images/communityIcon.png",scale: 18,color: Colors.white),
                Image.asset("assets/images/social.png",scale: 20, color: Colors.white,),
                Image.asset("assets/images/moreIcon.png",scale: 20,color: Colors.white),
              ],

            )

          ),
        ),
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  final String? name;
  PageOne({Key? key, this.name}) : super(key: key);
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {


  @override
  Widget build(BuildContext context) {
    return homeScreen(name: widget.name);
  }
}

class PageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const doctors();
  }
}

class PageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Community();
  }
}

class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ChatMainScreen();
  }
}

class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}


