import 'dart:ffi';
import 'dart:math';

import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Navigationdrawer extends StatefulWidget {
  const Navigationdrawer({super.key});

  @override
  State<Navigationdrawer> createState() => _NavigationdrawerState();
}

class _NavigationdrawerState extends State<Navigationdrawer> {
  double value= 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body:GestureDetector(
        onTap: (){
          print("nav screen tapped");
          setState(() {
            value = value == 0 ? 1 : 0;
          });
        },
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff6F7FA1),

              ),
            ),

            SafeArea(child:
            Container(
              width: 300.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DrawerHeader(child:
                  Column(children: [
                    CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage("assets/images/homescreenprofile.png"),
                    ),
                    SizedBox(height: 10,),
                    Text("My doctors", style: TextStyle(
                      color: Colors.white
                    ),),

                    Expanded(child: ListView(
                      children: [
                        ListTile(
                          onTap: (){

                          },
                          leading: Icon(Icons.person, color: Colors.white,),
                          title: Text("kjflkajf"),

                        )
                      ],
                    ))
                  ],))
                ],
              ),
            )),

            Expanded(
              child: TweenAnimationBuilder(
                child: MyHomePage(),
                tween: Tween<double>(begin: 0, end: value),
                  duration: Duration(milliseconds: 300),
                  builder: (_,double val,__){
                    return  Transform(transform: Matrix4.identity()..setEntry(3, 2, 0.001)..setEntry(0, 3, 200 * val)..rotateY((pi/6) *  val)
                    );
                  },),
            ),

          ],
        ),
      ),
    );
  }
}
