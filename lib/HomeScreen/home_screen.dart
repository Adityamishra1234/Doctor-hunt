import 'package:doctor_hunt/HomeScreen/home_screen_model.dart';
import 'package:doctor_hunt/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: camel_case_types
class homeScreen extends StatefulWidget {
  final String? name;
  const homeScreen({Key? key, this.name}) : super(key: key);
  @override
  State<homeScreen> createState() => _homeScreenState();
}

// ignore: camel_case_types
class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0EBE7F), // Set your desired color
      ),
    );

    return Scaffold(
      appBar: null,

      //Drawer yet to be implemented
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.white60),
              child: Padding(
                padding:  EdgeInsets.only(top: 18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset("assets/images/homescreenprofile.png"),
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Row(
                        children: [
                          Text("My Profile", style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),),
                          Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: GestureDetector(
                              child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
                            },),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),),
            Column(
              children: [
                ListTile(
                  title: Text("Your Booking"),
                  leading: Image.asset("assets/images/bookings.png"),
                ),
                ListTile(
                  title: Text("Your Garage"),
                  leading: Image.asset("assets/images/garage.png"),
                ),
                ListTile(
                  title: Text("Payments"),
                  leading: Image.asset("assets/images/payments.png"),
                ),
                ListTile(
                  title: Text("Insurance"),
                  leading: Image.asset("assets/images/insurance.png"),
                ),
                ListTile(
                  title: Text("About Us"),
                  leading: Image.asset("assets/images/about.png"),
                ),
                ListTile(
                  title: Text("Settings"),
                  leading: Image.asset("assets/images/settings.png"),
                ),
              ],
            ),
          ],
        ),

      ),

      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgabovecommon.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        height: 170,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), bottomLeft:Radius.circular(15) ),
                          gradient:  LinearGradient(
                            colors: [
                              Color(0xff0EBE7F),
                              Color(0xff0EBE7F),
                              Color(0xff0EBE7F),

                              // Color(0xfff7f4f4),
                              // Color(0xffebebeb),// Start color
                              Color(0xfff9f4f4),// Start color
                            ],
                            // begin: Alignment.topLeft,
                            // end: Alignment.bottomLeft,

                            begin: Alignment.topLeft,
                            end: Alignment.bottomLeft,

                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 30.0, right: 15 ,left: 12, bottom: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Hi, ${widget.name?.toUpperCase()}",
                                    maxLines: 5,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.white
                                    ),
                                  ),
                                  Text("Find Your Doctor",
                                    maxLines: 2,
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 50.0),
                                child: Image.asset("assets/images/homescreenprofile.png"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 50.0, left: 10, bottom: 8),
                      child:Text("Live Doctors",
                        maxLines: 2,
                        style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff414040),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 225,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Homecontents.length,
                        itemBuilder: (context, index){
                        return Container(
                          child: Stack(
                            children: [
                              Image.asset(Homecontents[index].image),
                              Positioned(
                                left:22,
                                  top: 23,
                                  child: Image.asset("assets/images/shadowlive.png", width: 125,)),
                             const  Positioned(
                                top:60,left:60,right:60, bottom:60,
                                  child:Icon(Icons.slow_motion_video, color: Colors.white,size: 40,)),
                              Positioned(
                                right: 25,top:35,
                                  child: Image.asset("assets/images/LiveImage.png"),),

                            ],
                          ),
                        );
                        },


                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 10.0, left: 10, right: 10, bottom: 8),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Categories",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff414040),
                            ),
                          ),
                          Text("See All",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:Color(0xff0EBE7F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Homecontents.length,
                        itemBuilder: (context, index){
                          return Container(
                          width: 110,
                          margin: const EdgeInsets.only(right: 4, left: 16, bottom: 5),
                          decoration: BoxDecoration(
                             gradient:  LinearGradient(
                                 colors: [
                                   // Color(0xFFFFFFFF),
                                   // Start color
                                   const Color(0xfff9f4f4),
                                   Homecontents[index].categoryColor,
                                   Homecontents[index].categoryColor,
                                   Homecontents[index].categoryColor,
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
                            child: Image.asset(Homecontents[index].image2),
                            );},


                      ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 18.0, left: 10, right: 10, bottom: 8),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Popular Doctors",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff414040),
                            ),
                          ),
                          Text("See All",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:Color(0xff0EBE7F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 350,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index){
                            return GestureDetector(
                              onTap: (){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 18, vertical: 10),
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
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        Image.asset("assets/images/populardoctor1.png" ,fit: BoxFit.contain,),
                                        const SizedBox(height: 10,),
                                        const Text("Dr. Fillerup Grab",textAlign: TextAlign.center, style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.w500,
                                          fontFamily: 'Abhaya',
                                          color: Colors.black,
                                        ),),
                                        const Text("Medicine Specialist",textAlign: TextAlign.center, style: TextStyle(
                                            fontSize: 13,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: 'Lato',
                                            color: Color(0xff5B5B5B),
                                            height: 2
                                        ),),
                                        const SizedBox(height: 10,),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                            5,
                                                (index) => const Icon(Icons.star, color: Color(0xff0EBE7F),),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } ),
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 18.0, left: 10, right: 10, bottom: 8),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Featured Doctors",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff414040),
                            ),
                          ),
                          Text("See All",
                            maxLines: 2,
                            style:  TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color:Color(0xff0EBE7F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Container(
                            width: 180,
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: const [BoxShadow(
                                color: Colors.grey,
                                spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              )]
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.favorite, color: Colors.red,),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Icon(Icons.star, color: Color(0xff0EBE7F),),
                                          SizedBox(width: 5,),
                                          Text("4.0", style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400
                                          ),)
                                        ],
                                      ),
                                    ],
                                  ),
                                  Image.asset("assets/images/featuredDoctor1.png", width: 80, height: 80,),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 12.0),
                                    child: Text("Dr. Mitanshi",
                                      maxLines: 2,
                                      style:  TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff414040),
                                        fontSize: 17
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        RichText(text: const TextSpan(
                                          text: "₹",
                                          style: TextStyle(
                                              color:  Color(0xff0EBE7F),
                                              fontWeight: FontWeight.w500
                                          ),

                                        )),
                                        RichText(text: const TextSpan(
                                          text: "500/hour",
                                          style: TextStyle(
                                              color:  Colors.grey,
                                              fontWeight: FontWeight.w400
                                          ),

                                        )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );},


                      ),
                    ),
                    SizedBox(height: 40,),



                  ],
                ),
              ),
              Positioned(
                top: 175,
                right: 15, left: 15,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
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
              ),


            ],
          ),
        ),
      ),

    );
  }}
