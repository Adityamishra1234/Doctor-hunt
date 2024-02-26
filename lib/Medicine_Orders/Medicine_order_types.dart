import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'My Doctors/my_doctors.dart';

class Order extends StatefulWidget {
  const Order({super.key});
  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
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
                  child: GridView.builder(
                    padding: EdgeInsets.all(10),
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20.0,
                        mainAxisSpacing: 20.0,
                      ),
                      itemCount: 5,
                      itemBuilder: (context, index){
                        return GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: -1, // Negative value to contain the shadow within the border
                                  blurRadius: 10,
                                  offset: const Offset(0, 6),
                                )
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color:  Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    // boxShadow: [
                                    //   BoxShadow(
                                    //     color: Colors.grey.withOpacity(0.5),
                                    //     spreadRadius: -1, // Negative value to contain the shadow within the border
                                    //     blurRadius: 10,
                                    //     offset: const Offset(0, 6),
                                    //   )
                                    // ],
                                    borderRadius: BorderRadius.circular(60),
                                    color: const Color(0x200EBE7F),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(40.0),
                                    child: Image.asset("assets/images/order1.png"),
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                Text("Guide to medicine order", style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w600
                                ),)

                              ],
                            ),
                          ),

                        );

                      }),
                )



              ],
            ),
          ),
        ),
      ),
    );
  }}
