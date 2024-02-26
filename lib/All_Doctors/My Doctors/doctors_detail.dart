import 'package:doctor_hunt/All_Doctors/My%20Doctors/appointment.dart';
import 'package:doctor_hunt/All_Doctors/My%20Doctors/my_doctors.dart';
import 'package:doctor_hunt/All_Doctors/My%20Doctors/select_time.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

// import 'My Doctors/my_doctors.dart';

class DoctorDetail extends StatefulWidget {
  const DoctorDetail({super.key});
  @override
  State<DoctorDetail> createState() => _DoctorDetailState();
}

class _DoctorDetailState extends State<DoctorDetail> {
  int current = 0;
  int current1 = 0;
  int current2 = 0;
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
              fit: BoxFit.fitHeight,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                  child: AppBarHeader("Doctor Details", () {
                    Navigator.of(context).pop();
                  }),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => const MyDoctors()));
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: -1.9, // Negative value to contain the shadow within the border
                            blurRadius: 6,
                            offset: const Offset(0, 10),
                          )
                        ]
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10, top: 10,bottom: 15),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image.asset("assets/images/alldoctor1.png"),
                              const SizedBox(width: 20,),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Dr. Aditya Mishra", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),),
                                        Padding(
                                          padding: EdgeInsets.only(right: 8.0),
                                          child: Icon(Icons.favorite, color: Colors.deepOrange,size: 25,),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 2,),
                                    const Text("Specialist Cardiologist", style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey,
                                      fontSize: 15,
                                    ),),
                                    const SizedBox(height: 5,),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children:List.generate(
                                            5,
                                                (index) => const Icon(Icons.star, color: CupertinoColors.systemYellow, size: 15,),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: RichText(text: const TextSpan(
                                              text: "₹",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color:  Color(0xff0EBE7F),
                                              ),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: " 250.00/hr",
                                                    style: TextStyle(
                                                        color: Colors.grey,
                                                        fontWeight: FontWeight.w500,
                                                        fontSize: 14
                                                    )
                                                )
                                              ]
                                          )),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                // width: 200,
                                height: 48,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color:const  Color(0xff0EBE7F),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                  child: TextButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const Appointment()));
                                    },
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5),
                                        )
                                    ),
                                    child:  Text("Book Appointment", style:  TextStyle(
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
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: -1.9, // Negative value to contain the shadow within the border
                                  blurRadius: 6,
                                  offset: const Offset(0, 5),
                                )
                              ]
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5,bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children:List.generate(
                                    3,
                                        (index) => Container(
                                          margin: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(12),
                                              color: Colors.white70,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.4),
                                                  spreadRadius: -1.5, // Negative value to contain the shadow within the border
                                                  blurRadius: 10,
                                                  offset: const Offset(0, 4),
                                                )
                                              ]
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.only(right: 20.0,left: 20, top: 12, bottom: 12),
                                            child: Column(
                                              children: [
                                                Text("100", style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 18,
                                                  color: Colors.black54
                                                ),),
                                                Text("Patient", style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  color: Colors.grey
                                                ),),
                                              ],
                                            ),
                                          ),
                                        ),
                                  ),
                                ),
                              ],
                            )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(" Services ", style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.black
                              ),),
                              const SizedBox(height: 20,),
                              SizedBox(
                                height: 120,
                                child: ListView.builder(
                                  physics:const NeverScrollableScrollPhysics(),
                                  itemCount: 3,
                                    itemBuilder: (context, index){
                                  return Column(
                                    children: [
                                      const Row(
                                        children: [
                                          Text(" 1.", style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color:  Color(0xff0EBE7F),
                                          ),),
                                          SizedBox(width: 8,),
                                          Text("That's why some of appointment reminder system.", style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey
                                          ),),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0,right: 20, left: 20, bottom: 8),
                                        child: Divider(color: Colors.grey[300],height: 8,),
                                      )
                                    ],
                                  );
                                }
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),

                        InteractiveViewer(
                          transformationController: TransformationController(),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      spreadRadius: -1.9, // Negative value to contain the shadow within the border
                                      blurRadius: 6,
                                      offset: const Offset(0, 5),
                                    )
                                  ]
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset( "assets/images/map.png",scale: 1,),
                              ),
                            ),
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
