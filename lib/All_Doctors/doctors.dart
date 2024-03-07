import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
// import 'package:doctor_hunt/My Doctors/my_doctors.dart';

import 'My Doctors/my_doctors.dart';

class doctors extends StatefulWidget {
  const doctors({Key? key}) : super(key: key);

  @override
  _doctorsState createState() => _doctorsState();
}

class _doctorsState extends State<doctors> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: DefaultTabController(
        length: 4,
        child: Container(
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
                  padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: AppBarHeader("All Doctors", () {
                    Navigator.of(context).pop();
                  }),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: -2,
                          blurRadius: 9,
                          offset: const Offset(0, 6),
                        )
                      ]
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
                    child: TextField(
                      cursorColor:  Color(0xff0EBE7F),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffixIcon: Icon(Icons.cancel_outlined),
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 8,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                            setState(() {
                              current= index;
                            });
                          },
                          child: AnimatedContainer(
                            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                            width: 80,
                            height: 45,
                            decoration: BoxDecoration(
                              color: current ==index?Color(0xff0EBE7F): Color(0x100EBE7F),
                              borderRadius: current == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5)),
                            ),
                            duration: Duration(milliseconds: 200),
                            child: Center(child: Text("Dentist",style: TextStyle(
                                color: current ==index? Color(0xffFFFFFF) : Color(0xff0EBE7F)
                            ),),),
                          ),
                        );
                      }
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance.collection("All Doctors").snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.3,
                                ),
                                Center(
                                  child: CircularProgressIndicator(color: Color(0xff0EBE7F)),
                                ),
                              ],
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          }
                          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                            return Column(
                              children: [
                                SizedBox(
                                  height: MediaQuery.of(context)
                                      .size
                                      .height *
                                      0.3,
                                ),
                                Center(
                                  child: Text(" No Data Found ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20,
                                    ),),
                                ),
                              ],
                            );
                          }
                          return Column(
                            children: snapshot.data!.docs.map((doc) {
                              Map<String, dynamic> doctorData = doc.data() as Map<String, dynamic>;
                              return GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MyDoctors()));
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(18),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: -1.3, // Negative value to contain the shadow within the border
                                          blurRadius: 6,
                                          offset: const Offset(0, 4),
                                        )
                                      ]
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10, left: 10, top: 10,bottom: 15),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(50), // Adjust the value as per your requirement
                                          child: Image.network(
                                            "${doctorData['image']}",
                                            fit: BoxFit.fill,
                                            width: 70, // Ensure to specify width and height to maintain the border radius
                                            height: 70,
                                          ),
                                        ),

                                        SizedBox(width: 20,),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text("Dr. ${doctorData['name']}",
                                                    style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 20,
                                                  ),),
                                                  Icon(Icons.favorite, color: Colors.deepOrange,size: 25,)
                                                ],
                                              ),
                                              SizedBox(height: 2,),
                                              Text("${doctorData['category']} Specialist", style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                                fontSize: 15,
                                              ),),
                                              SizedBox(height: 5,),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: List.generate(
                                                      doctorData['Total_rating'].round(),
                                                          (index) => Icon(Icons.star, color: CupertinoColors.systemYellow, size: 15,),
                                                    ),
                                                  ),
                                                  RichText(text: TextSpan(
                                                      text: "2.8",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                          color: Colors.black
                                                      ),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text: " (${doctorData['Total_patient_views']}) ",
                                                            style: TextStyle(
                                                                color: Colors.grey,
                                                                fontWeight: FontWeight.w500,
                                                                fontSize: 12
                                                            )
                                                        )
                                                      ]
                                                  ))
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        }
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
