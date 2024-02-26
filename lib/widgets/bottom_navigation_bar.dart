import 'package:doctor_hunt/All_Doctors/doctors.dart';
import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/More/moreBar.dart';
import 'package:doctor_hunt/auth/login.dart';
import 'package:doctor_hunt/auth/signup.dart';
import 'package:flutter/material.dart';

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
    return Scaffold(
      appBar: null,
      body: _pages[_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: DefaultTextStyle(
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              currentIndex: _currentIndex,
              onTap: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              selectedLabelStyle: TextStyle(fontWeight: FontWeight.w500),
              unselectedItemColor: Colors.grey, // Set the selected item text color
              selectedItemColor: const Color(0xff0EBE7F),
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Favourite',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu_book),
                  label: 'Community',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_outlined, size: 25,),
                  label: 'More',
                ),
              ],
            ),

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
    return const homeScreen();
  }
}
class PageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const homeScreen();
  }
}
class PageFive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const ProfileScreen();
  }
}
