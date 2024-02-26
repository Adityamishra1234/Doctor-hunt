import 'package:doctor_hunt/All_Doctors/My%20Doctors/doctors_detail.dart';
import 'package:doctor_hunt/All_Doctors/My%20Doctors/my_doctors.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'My Doctors/my_doctors.dart';

class SelectSlotTime extends StatefulWidget {
  const SelectSlotTime({super.key});
  @override
  State<SelectSlotTime> createState() => _SelectSlotTimeState();
}

class _SelectSlotTimeState extends State<SelectSlotTime> {
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
                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                    child: AppBarHeader("Select Time", () {
                      Navigator.of(context).pop();
                    }),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                   onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const MyDoctors()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
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
                  padding: EdgeInsets.only(right: 10, left: 10, top: 10,bottom: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/alldoctor1.png"),
                      SizedBox(width: 20,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Dr. Aditya Mishra", style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Icon(Icons.favorite, color: Colors.deepOrange,size: 25,),
                                )
                              ],
                            ),
                            SizedBox(height: 2,),
                            Text("Clinic Name Here ", style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                              fontSize: 15,
                            ),),
                            SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children:List.generate(
                                    5,
                                        (index) => Icon(Icons.star, color: CupertinoColors.systemYellow, size: 15,),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
                  const SizedBox(height: 20),

                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 85,
                            width: double.infinity,
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: 8,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  return GestureDetector(
                                    onTap: (){
                                      setState(() {
                                        current = index;
                                      });
                                    },
                                    child: AnimatedContainer(
                                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                      height: 55,
                                      decoration: BoxDecoration(
                                        border:  current  == index ?Border.all(color: Colors.transparent):Border.all(color: Colors.black12),
                                        color: current ==index?Color(0xff0EBE7F): Color(0x50FFFFFF),
                                        borderRadius: current == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5),
                                        ),),
                                      duration: Duration(milliseconds: 200),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Center(child: Text("Tomorrow, 26 Jan",style: TextStyle(
                                              fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: current==index? Color(0xffFFFFFF) : Colors.black54
                                            ),),),
                                            SizedBox(height: 0.9,),
                                            Center(child: Text("3 Slots available",style: TextStyle(
                                              fontSize: 11,
                                                fontWeight: FontWeight.w300,
                                                color: current==index? Color(0xffFFFFFF) : Colors.black
                                            ),),),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          const SizedBox(height: 35,),
                          current == 0 || current == 2  || current == 4 || current ==7?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(child: Text("Tomorrow, 26 Jan",style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54
                              ),),),
                              SizedBox(height: 8.9,),
                              Center(child: Text("No Slots available",style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.grey
                              ),),),
                              SizedBox(height: 18.9,),
                              AnimatedContainer(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                height: 65,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0x700EBE7F)),
                                  color: Color(0x50FFFFFF),
                                  borderRadius: BorderRadius.all(Radius.circular(5),
                                  ),),
                                duration: Duration(milliseconds: 200),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(child: Text("Contact Clinic",style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xff0EBE7F)
                                      ),),),
                                    ],
                                  ),
                                ),
                              ),
                              Center(child: Text("OR",style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color:Colors.black45
                              ),),),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    current<8?current +=1:current=0; //edit this logic after completing frontend
                                  });
                                },
                                child: AnimatedContainer(
                                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                  height: 65,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.transparent),
                                    color:  Color(0xff0EBE7F),
                                    borderRadius: BorderRadius.all(Radius.circular(5),
                                    ),),
                                  duration: Duration(milliseconds: 200),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                                    child: Column(mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text("Check Next availability",style: TextStyle(
                                                  overflow: TextOverflow.ellipsis,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffFFFFFF)
                                              ),),
                                              SizedBox(width: 2,),
                                              Icon(Icons.arrow_forward_ios, color:Colors.white,size: 20)
                                            ],
                                          ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),


                            ],
                          ):
                          Stack(
                            children: [
                              Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(child: Text("Tomorrow, 26 Jan",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black
                                ),),),

                                SizedBox(height: 25.9,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text("Afternoon 7 slots",style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 190,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 7,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 1.0,
                                        mainAxisSpacing: 4.0,
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                     return GestureDetector(
                                       onTap: (){
                                         setState(() {
                                           current1 = index;
                                         });
                                       },
                                       child: AnimatedContainer(
                                         margin: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                                         height: 35,
                                         decoration: BoxDecoration(
                                           border:  current1  == index ?Border.all(color: Colors.transparent):Border.all(color: Colors.transparent),
                                           color: current1 ==index?Color(0xff0EBE7F): Color(0x200EBE7F),
                                           borderRadius: current1 == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5),
                                           ),),
                                         duration: Duration(milliseconds: 200),
                                         child: Center(child: Text("1:00 PM",style: TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.bold,
                                             color: current1==index? Color(0xffFFFFFF) : Colors.black54
                                         ),),),
                                       ),
                                     );
                                      },
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Evening 7 slots",style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black
                                  ),),
                                ),
                                SizedBox(
                                  height: 190,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 7,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount:2,
                                        crossAxisSpacing: 1.0,
                                        mainAxisSpacing: 4.0,
                                      ),
                                      itemBuilder: (BuildContext context, int index) {
                                     return GestureDetector(
                                       onTap: (){
                                         setState(() {
                                           current2 = index;
                                         });
                                       },
                                       child: AnimatedContainer(
                                         margin: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                                         height: 35,
                                         decoration: BoxDecoration(
                                           border:  current2  == index ?Border.all(color: Colors.transparent):Border.all(color: Colors.transparent),
                                           color: current2 ==index?Color(0xff0EBE7F): Color(0x200EBE7F),
                                           borderRadius: current2 == index ? BorderRadius.all(Radius.circular(10)):BorderRadius.all(Radius.circular(5),
                                           ),),
                                         duration: Duration(milliseconds: 200),
                                         child: Center(child: Text("1:00 PM",style: TextStyle(
                                             fontSize: 12,
                                             fontWeight: FontWeight.bold,
                                             color: current2==index? Color(0xffFFFFFF) : Colors.black54
                                         ),),),
                                       ),
                                     );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                              Positioned(
                                bottom: 0,
                                right: 8,
                                left: 8,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 10.0, bottom: 8, left: 10, ),
                                  child: GestureDetector(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const DoctorDetail()));
                                    },
                                    child: AnimatedContainer(
                                      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                                      height: 55,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.transparent),
                                        color: Color(0xff0EBE7F),
                                        borderRadius:BorderRadius.all(Radius.circular(5),
                                        ),),
                                      duration: Duration(milliseconds: 200),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Check Details",style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xffFFFFFF)
                                          ),),
                                          SizedBox(width: 3,),
                                          Icon(Icons.arrow_forward_ios, color:Colors.white,size: 20,)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ]
                          )
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
