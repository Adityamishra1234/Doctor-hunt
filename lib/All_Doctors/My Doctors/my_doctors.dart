import 'package:doctor_hunt/All_Doctors/My%20Doctors/select_time.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widgets/customButton.dart';

class MyDoctors extends StatefulWidget {
  const MyDoctors({super.key});
  @override
  State<MyDoctors> createState() => _MyDoctorsState();
}

class _MyDoctorsState extends State<MyDoctors> {
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
              image: AssetImage("assets/images/bgcommon.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                  child: AppBarHeader("My Doctors", () {
                    Navigator.of(context).pop();
                  }),
                ),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                  child: const Padding(
                    padding: EdgeInsets.only(right: 15, left: 15, top: 5,bottom: 5),
                    child: TextField(
                      cursorColor:  Color(0xff0EBE7F),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        suffix: Icon(Icons.cancel_outlined),
                        hintText: "Search",
                      ),
                    ),
                  ),
                ),
                // Expanded(
                //   child: Column(
                //     children: [
                //      const  TabBar(
                //         padding: EdgeInsets.all(15),
                //         indicator: BoxDecoration(
                //           color: Color(0xff0EBE7F),
                //           borderRadius: BorderRadius.all(Radius.circular(5))
                //         ),
                //         // labelColor:Color(0xff0EBE7F),
                //         labelColor:Color(0xffFFFFFF),
                //         tabs: [
                //           Tab(text: "All"),
                //           Tab(text: "Dentist"),
                //           Tab(text: "Cardiology"),
                //           Tab(text: "Cancer"),
                //           Tab(text: "Eye Specialist"),
                //         ],
                //         isScrollable: true,
                //         labelPadding:
                //         EdgeInsets.symmetric(horizontal: 25),
                //       ),
                //       Expanded(child: SizedBox(
                //         height: 400,
                //         child: TabBarView(
                //         children: [
                //           ListView.builder(
                //               itemCount: 8,
                //               shrinkWrap: true,
                //               padding: EdgeInsets.zero,
                //               // physics: NeverScrollableScrollPhysics(),
                //               itemBuilder: (context, index) {
                //                 return Container(
                //                   margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                //                   decoration: BoxDecoration(
                //                     // borderRadius: BorderRadius.circular(20),
                //                       color:
                //                       const Color(0xffFFEFCF),
                //                       boxShadow: [
                //                         BoxShadow(
                //                             spreadRadius: 1,
                //                             blurRadius: 3,
                //                             color: Colors.black.withOpacity(0.1)
                //                         )
                //                       ]
                //                   ),
                //                   child: Row(
                //                     crossAxisAlignment: CrossAxisAlignment.start,
                //                     children: [
                //                       Padding(
                //                         padding: const EdgeInsets.all(8.0),
                //                         child:
                //                         Image.asset("assets/images/categoryImage2.png"),
                //                       ),
                //                       Expanded(
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(8.0),
                //                           child: Column(
                //                             crossAxisAlignment: CrossAxisAlignment.start,
                //                             children: [
                //                               // SizedBox(
                //                               //   height: 5,
                //                               // ),
                //                               Text(
                //                                 "Meditation for joy (Meditation)",
                //                                 style: TextStyle(
                //                                     color: Colors.black,
                //                                     fontWeight: FontWeight.w400,
                //                                     fontSize: 13,
                //                                     fontFamily: 'PlayfairDisplay'),
                //                               ),
                //                               SizedBox(
                //                                 height: 2,
                //                               ),
                //                               Text(
                //                                 "Mar 3, 2021",
                //                                 style: TextStyle(
                //                                     color: Colors.black.withOpacity(0.5),
                //                                     fontWeight: FontWeight.w500,
                //                                     fontSize: 11),
                //                               ),
                //                               SizedBox(
                //                                 height: 2,
                //                               ),
                //                               Text(
                //                                 "Meditation",
                //                                 style: TextStyle(
                //                                     color: Colors.black.withOpacity(0.5),
                //                                     fontWeight: FontWeight.w500,
                //                                     fontSize: 11),
                //                               ),
                //                               SizedBox(
                //                                 height: 5,
                //                               ),
                //                               Text(
                //                                 "Why is existence cyclical? Does the wheel of karma turn relentlessly? What role does one’s individual dharma....",
                //                                 style: TextStyle(
                //                                     color: Colors.black.withOpacity(0.7),
                //                                     fontWeight: FontWeight.w500,
                //                                     fontSize: 11,
                //                                     height:1.2
                //                                 ),
                //                               ),
                //                             ],
                //                           ),
                //                         ),
                //                       ),
                //                     ],
                //                   ),
                //                 );
                //               }),
                //         ],
                //         ),
                //       ))
                //     ],
                //   ),
                // ),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // SizedBox(
                        //   height: 55,
                        //   width: double.infinity,
                        //   child: ListView.builder(
                        //       physics: const BouncingScrollPhysics(),
                        //       itemCount: 8,
                        //       scrollDirection: Axis.horizontal,
                        //       itemBuilder: (context, index){
                        //         return GestureDetector(
                        //           onTap: (){
                        //             setState(() {
                        //               current= index;
                        //             });
                        //           },
                        //           child: AnimatedContainer(
                        //             margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        //             width: 80,
                        //             height: 45,
                        //             decoration: BoxDecoration(
                        //               color: current ==index?Color(0xff0EBE7F): Color(0x100EBE7F),
                        //               borderRadius: current == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5),
                        //               ),),
                        //             duration: Duration(milliseconds: 200),
                        //             child: Center(child: Text("Dentist",style: TextStyle(
                        //                 color: current ==index? Color(0xffFFFFFF) : Color(0xff0EBE7F)
                        //             ),),),
                        //           ),
                        //         );
                        //       }),
                        // ),
                        Container(
                          width: double.infinity,
                          height: 720,
                          margin: const EdgeInsets.only(top: 5),
                          child: ListView.builder(
                              itemCount: 10,
                              itemBuilder: (context, index){
                                return Container(
                                  margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 10),
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
                                    padding: const EdgeInsets.only(right: 10, left: 10, top: 10,bottom: 15),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Image.asset("assets/images/alldoctor1.png",scale: 0.8,),
                                            const SizedBox(width: 20,),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  const Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: [
                                                      Text("Dr. Mishra", style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 20,
                                                      ),),
                                                      Icon(Icons.favorite, color: Colors.deepOrange,size: 25,)
                                                    ],
                                                  ),
                                                  const Text("Specialist Dentist", style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff0EBE7F),
                                                    fontSize: 15,
                                                  ),),
                                                  const SizedBox(height: 3,),
                                                  const Text("6 Years Experience", style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                  ),),
                                                  const SizedBox(height: 5,),
                                                  Row(
                                                    children: [
                                                      const Row(
                                                        children: [
                                                          Icon(Icons.star_rate, color: Color(0xff0EBE7F), size: 18,),
                                                          SizedBox(width: 5,),
                                                          Text("87%", style: TextStyle(
                                                            fontWeight: FontWeight.w600,
                                                            color: Colors.grey,
                                                            fontSize: 12,
                                                          ),),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 20,),
                                                      Row(
                                                        children: [
                                                          const Icon(Icons.work_history_outlined, color: Color(0xff0EBE7F), size: 18,),
                                                          const SizedBox(width: 2.1,),
                                                          Container(
                                                            child: const Text("69 Patient Stories", maxLines: 3, style: TextStyle(
                                                              fontWeight: FontWeight.w600,
                                                              overflow: TextOverflow.clip,
                                                              color: Colors.grey,
                                                              fontSize: 12,
                                                            ),),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text("Next Available", style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xff0EBE7F),
                                                  fontSize: 15,
                                                ),),
                                                Text("10:00 AM tomorrow", style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                ),),
                                              ],
                                            ),
                                            Container(
                                              // width: 200,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(12),
                                                color:const  Color(0xff0EBE7F),
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                                child: TextButton(
                                                  onPressed: (){
                                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const SelectSlotTime()));
                                                  },
                                                  style: TextButton.styleFrom(
                                                      shape: RoundedRectangleBorder(
                                                        borderRadius: BorderRadius.circular(5),
                                                      )
                                                  ),
                                                  child:  const Text("Book Now", style:  TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15,
                                                      fontWeight: FontWeight.w600,
                                                      letterSpacing: 0.5
                                                  ),),
                                                ),
                                              ),
                                            ),

                                        ],)
                                      ],
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }}
