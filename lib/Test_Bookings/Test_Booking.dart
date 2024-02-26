import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../All_Doctors/My Doctors/select_time.dart';
import '../HomeScreen/home_screen_model.dart';
import '../widgets/AppBarHeader.dart';

class TestBooking extends StatefulWidget {
  const TestBooking({super.key});

  @override
  State<TestBooking> createState() => _TestBookingState();
}

class _TestBookingState extends State<TestBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgabovecommon.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 18, vertical: 15),
                child: AppBarHeader("Tests Booking", () {
                  Navigator.of(context).pop();
                }),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        const Text("Get Full body health checkups from the comfort of your home.", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 21,
                          ),),
                        const SizedBox(height: 5),
                        const Text("Upto 45% off + get 10% healthcash back",
                          textAlign: TextAlign.center, style:
                          TextStyle(
                            color: const  Color(0xff0EBE7F),
                            fontWeight: FontWeight.w300,
                            fontSize: 18,
                          ),),
                        const SizedBox(height: 20,),
                        SizedBox(
                          height: 90,
                          width: double.infinity,
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:60,
                                    height: 60,
                                    margin: const EdgeInsets.only(right: 4, left: 16, bottom: 5),
                                    decoration: BoxDecoration(
                                        gradient:  const LinearGradient(
                                          colors: [
                                            // Color(0xFFFFFFFF),
                                            // Start color
                                            Color(0xfff9f4f4),
                                            // Homecontents[index].categoryColor,
                                            // Homecontents[index].categoryColor,
                                            // Homecontents[index].categoryColor,
                                            Color(0xff2753F3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,

                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        )]
                                    ),
                                    child: Image.asset(Homecontents[index].image2,fit: BoxFit.scaleDown,),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Free Home"),
                                      Text("Simple Pickup"),
                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                ],
                              );

                          }),
                        ),
                        SizedBox(
                          height: 90,
                          width: double.infinity,
                          child:ListView.builder(
                            scrollDirection: Axis.horizontal,
                            // physics: NeverScrollableScrollPhysics(),
                              itemCount: 2,
                              itemBuilder: (context, index){
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width:60,
                                    height: 60,
                                    margin: const EdgeInsets.only(right: 4, left: 16, bottom: 5),
                                    decoration: BoxDecoration(
                                        gradient:  const LinearGradient(
                                          colors: [
                                            // Color(0xFFFFFFFF),
                                            // Start color
                                            Color(0xfff9f4f4),
                                            // Homecontents[index].categoryColor,
                                            // Homecontents[index].categoryColor,
                                            // Homecontents[index].categoryColor,
                                            Color(0xff2753F3),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,

                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: const [BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                          blurRadius: 2,
                                          offset: Offset(0, 2),
                                        )]
                                    ),
                                    child: Image.asset(Homecontents[index].image2,fit: BoxFit.scaleDown,),
                                  ),
                                  const SizedBox(width: 10,),
                                  const Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Free Home"),
                                      Text("Simple Pickup"),
                                    ],
                                  ),
                                  const SizedBox(width: 10,),
                                ],
                              );

                          }),
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Recommended for You ", style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black
                            ),),
                            SizedBox(
                              height:2850,
                              width: double.infinity,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                  itemCount: 6,
                                  itemBuilder: (context, index){
                                    return GestureDetector(
                                      onTap: (){
                                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 10),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: CupertinoColors.white,
                                            borderRadius: BorderRadius.circular(10),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey.withOpacity(0.5),
                                                spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                                blurRadius: 5,
                                                offset: const Offset(0, 2),
                                              )],
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const Text("Advanced Young Indian Health Checkup",textAlign: TextAlign.center, style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                  fontFamily: 'Abhaya',
                                                  color: Colors.black,
                                                ),),
                                                Text("Ideal for individuals aged 21-40 years ",textAlign: TextAlign.center, style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  // fontFamily: 'Abhaya',
                                                  color: Colors.grey[500],
                                                ),),
                                                AnimatedContainer(
                                                  margin: const EdgeInsets.symmetric(vertical: 15,),
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(color: const Color(0x700EBE7F)),
                                                    color: const Color(0x50FFFFFF),
                                                    borderRadius: const BorderRadius.all(Radius.circular(5),
                                                    ),),
                                                  duration: const Duration(milliseconds: 200),
                                                  child: const Center(child: Text("169 tests included",style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight: FontWeight.bold,
                                                      color: Color(0xff0EBE7F)
                                                  ),),),
                                                ),
                                                Image.asset("assets/images/testBookingImage.png"),
                                                SizedBox(height: 15,),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        const Row(
                                                          children: [
                                                            Text("₹350",textAlign: TextAlign.center,  style: TextStyle(
                                                              decoration: TextDecoration.lineThrough,
                                                              decorationThickness: 2,
                                                              fontSize: 18,
                                                              fontWeight: FontWeight.bold,
                                                              // fontFamily: 'Abhaya',
                                                              color: Colors.black,
                                                            ),),
                                                            SizedBox(width: 6,),
                                                            Text("₹280",textAlign: TextAlign.center, style: TextStyle(
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                              // fontFamily: 'Abhaya',
                                                              color: Colors.black,
                                                            ),),
                                                            SizedBox(width: 6,),
                                                            Text("20% off",textAlign: TextAlign.center, style: TextStyle(
                                                                fontSize: 10,
                                                                fontWeight: FontWeight.bold,
                                                                // fontFamily: 'Abhaya',
                                                                color: Color(0xff0EBE7F)
                                                            ),),

                                                          ],
                                                        ),
                                                        Text("+10% Health Cashback with T&C",maxLines:4,textAlign: TextAlign.center, style: TextStyle(
                                                            fontSize: 10,
                                                            overflow: TextOverflow.ellipsis,
                                                            fontWeight: FontWeight.w300,
                                                            color: Colors.grey[600]
                                                        ),),
                                                      ],
                                                    ),


                                                    //book now button
                                                    Container(
                                                      // width: 200,
                                                      height: 40,
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

                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  } ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
