import 'package:flutter/material.dart';

import '../widgets/AppBarHeader.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({super.key});

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {

  List<String> help = [
    "Booking a new Appointment", "Existing Appointment", "Online consultations", "Feedbacks" ,"Medicine orders","Diagnostic Tests", "Health plans", "My account and Practo Drive", "Have a feature in mind" ,"Other issues",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgabovecommon.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: AppBarHeader("Help Center", () {
                  Navigator.of(context).pop();
                }),
              ),
              const SizedBox(height: 3),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -2, // Negative value to contain the shadow within the border
                          blurRadius: 9,
                          offset: const Offset(0, 6),
                        )
                      ]
                  ),
                  child: Center(
                    child: Text("I have an issue with ", style: TextStyle(
                      color: const  Color(0xff0EBE7F),
                      fontWeight: FontWeight.w300,
                      fontSize: 20
                    ),),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: help.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        minVerticalPadding: 15,
                        selected: false,
                        title:  Text("${help[index]}", style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w300,
                            fontSize: 20
                        ),),
                        trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 18,),
                      );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
