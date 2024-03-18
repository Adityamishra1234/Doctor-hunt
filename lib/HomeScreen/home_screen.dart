import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/All_Doctors/doctors.dart';
import 'package:doctor_hunt/Firebase_Backend/auth/google_sign_in.dart';
import 'package:doctor_hunt/HomeScreen/home_screen_model.dart';
import 'package:doctor_hunt/auth/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';

import '../Firebase_Backend/auth/userProvider.dart';
import '../constants/constants.dart';
import '../widgets/CachedImageView.dart';

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
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0EBE7F), // Set your desired color
      ),
    );

    final userProvider = Provider.of<UserProvider>(context);
    final userPhoto = userProvider.userPhotoUrl;

    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: false,

      //Drawer yet to be implemented
      // drawer: Drawer(
      //   child: ListView(
      //     children: [
      //       DrawerHeader(
      //         decoration: BoxDecoration(color: Colors.white60),
      //         child: Padding(
      //           padding:  EdgeInsets.only(top: 18.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Image.asset("assets/images/homescreenprofile.png"),
      //               Padding(
      //                 padding: const EdgeInsets.only(top: 14.0),
      //                 child: Row(
      //                   children: [
      //                     Text("My Profile", style: TextStyle(
      //                       fontWeight: FontWeight.w400,
      //                       fontSize: 20,
      //                     ),),
      //                     Padding(
      //                       padding: const EdgeInsets.only(left: 4.0),
      //                       child: GestureDetector(
      //                         child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),onTap: (){
      //                         Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
      //                       },),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),),
      //       Column(
      //         children: [
      //           ListTile(
      //             title: Text("Your Booking"),
      //             leading: Image.asset("assets/images/bookings.png"),
      //           ),
      //           ListTile(
      //             title: Text("Your Garage"),
      //             leading: Image.asset("assets/images/garage.png"),
      //           ),
      //           ListTile(
      //             title: Text("Payments"),
      //             leading: Image.asset("assets/images/payments.png"),
      //           ),
      //           ListTile(
      //             title: Text("Insurance"),
      //             leading: Image.asset("assets/images/insurance.png"),
      //           ),
      //           ListTile(
      //             title: Text("About Us"),
      //             leading: Image.asset("assets/images/about.png"),
      //           ),
      //           ListTile(
      //             title: Text("Settings"),
      //             leading: Image.asset("assets/images/settings.png"),
      //           ),
      //         ],
      //       ),
      //     ],
      //   ),
      //
      // ),

      body: SafeArea(
        child: LiquidPullToRefresh(
          springAnimationDurationInMilliseconds:600,
          color: Color(0xff0EBE7F),
          onRefresh: () async{
            await Provider.of<UserProvider>(context, listen: false).loadUserDataWithFuture();
          },
          child: FutureBuilder<void>(
            future: Provider.of<UserProvider>(context).loadUserDataWithFuture(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting || snapshot.error is SocketException) {
                return Center(
                  child: CircularProgressIndicator(color: Color(0xff0EBE7F)),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                final userProvider = Provider.of<UserProvider>(context);
                final userName = userProvider.userName;
                return SingleChildScrollView(
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
                                            widget.name != null? Text("Hi, ${widget.name?.toUpperCase()}",
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                fontFamily: 'Lato',
                                              ),
                                            ):Text("Hi, ${userName.toUpperCase()}",
                                              maxLines: 5,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w300,
                                                  color: Colors.white,
                                                fontFamily: 'Lato',
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
                                          child: Container(
                                            width: 60,
                                            height: 70,
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(30),
                                                child: CachedImageView(
                                                  image: "${userPhoto}",
                                                  fit: BoxFit.fill,
                                                  width: double.infinity,
                                                  height: 220,
                                                  errorHeight: 220,
                                                  errorWidth: double.infinity,
                                                  placeHolderHeight: 220,
                                                  placeHolderWidth: double.infinity,
                                                ),),
                                          ),
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
                                height: 170,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Homecontents.length,
                                  itemBuilder: (context, index){
                                    return Container(
                                      child: Stack(
                                        children: [
                                          Image.asset(Homecontents[index].image),
                                          Positioned(
                                              left:15,
                                              top: 14,
                                              child: Image.asset("assets/images/shadowlive.png", width: 100,)),
                                          const  Positioned(
                                              top:20,left:20,right:20, bottom:20,
                                              child:Icon(Icons.slow_motion_video, color: Colors.white,size: 40,)),
                                          Positioned(
                                            right: 18,top:25,
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
                                height: 100,
                                child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Homecontents.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => doctors()),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 4, left: 12, bottom: 5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          colors: [
                                            const Color(0xfff9f4f4),
                                            Homecontents[index].categoryColor,
                                            Homecontents[index].categoryColor,
                                            Homecontents[index].categoryColor,
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                        ),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: -1.2,
                                            blurRadius: 2,
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          Homecontents[index].image2,
                                          scale: 1.6,
                                          // width: 50,
                                          // height: 50,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Text(
                                      "Category Name",
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff414040),
                                      ),
                                    ),
                                  ],
                                ),
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
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("All Doctors").where('popularity' , isEqualTo:  "yes").snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting ||snapshot.error is SocketException) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.15,
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
                                                  0.15,
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
                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data?.docs.length,
                                          itemBuilder: (context, index){
                                            Map<String, dynamic>doctorData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                                            return GestureDetector(
                                              onTap: (){
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                              },
                                              child: Container(
                                                width: 280,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15, vertical: 10),
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
                                                    padding: EdgeInsets.all(20.0),
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          height: 135,
                                                          width: double.infinity,
                                                          child: Container(
                                                            width: 60,
                                                            height: 70,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(10),
                                                              child: CachedImageView(
                                                                image: "${doctorData['image']}",
                                                                fit: BoxFit.fill,
                                                                width: double.infinity,
                                                                height: 220,
                                                                errorHeight: 220,
                                                                errorWidth: double.infinity,
                                                                placeHolderHeight: 220,
                                                                placeHolderWidth: double.infinity,
                                                              ),),
                                                          ),),
                                                        const SizedBox(height: 10,),
                                                        Text("Dr. ${doctorData['name']}",textAlign: TextAlign.center, style: TextStyle(
                                                          fontSize: 17,
                                                          fontWeight: FontWeight.w600,
                                                          fontFamily: 'lato',
                                                          color: Colors.black,
                                                        ),),
                                                        Text("${doctorData['category']} Specialist",textAlign: TextAlign.center, style: TextStyle(
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w300,
                                                            fontFamily: 'Lato',
                                                            color: Color(0xff5B5B5B),
                                                            height: 2
                                                        ),),
                                                        const SizedBox(height: 10,),
                                                        Text("${doctorData['about']}",maxLines: 2, style: TextStyle(
                                                            overflow: TextOverflow.ellipsis,
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Lato',
                                                            color: Colors.black54,
                                                            height: 1.5
                                                        ),),
                                                        const SizedBox(height: 10,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: List.generate(
                                                            doctorData['Total_rating'].round(),
                                                                (index) => const Icon(Icons.star, color: Color(0xff0EBE7F)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          } );
                                    }
                                ),
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
                                height: 250,
                                width: double.infinity,
                                child: StreamBuilder<QuerySnapshot>(
                                    stream: FirebaseFirestore.instance.collection("All Doctors").where('popularity' , isEqualTo:  "yes").snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.connectionState == ConnectionState.waiting ||snapshot.error is SocketException) {
                                        return Column(
                                          children: [
                                            SizedBox(
                                              height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                                  0.15,
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
                                                  0.15,
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
                                      return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: snapshot.data?.docs.length,
                                          itemBuilder: (context, index){
                                            Map<String, dynamic>doctorData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                                            return GestureDetector(
                                              onTap: (){
                                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                              },
                                              child: Container(
                                                width: 340,
                                                padding: const EdgeInsets.symmetric(
                                                    horizontal: 15, vertical: 10),
                                                child:
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: CupertinoColors.white,
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey.withOpacity(0.5),
                                                        spreadRadius: -0.2,
                                                        blurRadius: 2,
                                                        offset: const Offset(0, 2),
                                                      )],
                                                  ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(20.0),
                                                    child: Column(
                                                      children: [
                                                        ListTile(
                                                          leading: Container(
                                                            width: 60,
                                                            height: 60,
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(60),
                                                              child: CachedImageView(
                                                                image: "${doctorData['image']}",
                                                                fit: BoxFit.fill,
                                                                width: double.infinity,
                                                                height: 220,
                                                                errorHeight: 220,
                                                                errorWidth: double.infinity,
                                                                placeHolderHeight: 220,
                                                                placeHolderWidth: double.infinity,
                                                              ),),
                                                          ),
                                                          contentPadding: EdgeInsets.symmetric(horizontal: 0),
                                                          title: Text("Dr. ${doctorData['name']}", style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w600,
                                                            fontFamily: 'lato',
                                                            color: Colors.black,
                                                          ),),
                                                          subtitle: Row(
                                                            children: [
                                                              Icon(Icons.location_on,color: Colors.red, size: 18,),
                                                              SizedBox(width: 2,),
                                                              Text("${doctorData['clinic'][1]}".substring(4), style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight: FontWeight.w300,
                                                                  fontFamily: 'Lato',
                                                                  color: Color(0xff5B5B5B),
                                                                  height: 2
                                                              ),),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(height: 10,),
                                                        Text("${doctorData['about']}",maxLines: 2, style: TextStyle(
                                                            overflow: TextOverflow.ellipsis,
                                                            fontSize: 13,
                                                            fontWeight: FontWeight.w400,
                                                            fontFamily: 'Lato',
                                                            color: Colors.black54,
                                                            height: 1.5
                                                        ),),
                                                        const SizedBox(height: 15,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            ElevatedButton(
                                                              onPressed: (){}, child:
                                                            Text("Send Message",maxLines: 1, style: TextStyle(
                                                                overflow: TextOverflow.ellipsis,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w700,
                                                                fontFamily: 'Lato',
                                                                color: Colors.white,
                                                                height: 1.5
                                                            ),),
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: K.primaryColor,
                                                                shape:RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                ),
                                                              ),
                                                            ),
                                                            ElevatedButton(
                                                              onPressed: (){}, child:
                                                            Text(" View Details ",maxLines: 1, style: TextStyle(
                                                                overflow: TextOverflow.ellipsis,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight.w700,
                                                                fontFamily: 'Lato',
                                                                color: K.primaryColor,
                                                                height: 1.5
                                                            ),),
                                                              style: ElevatedButton.styleFrom(
                                                                backgroundColor: Colors.white,
                                                                  shape:RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(2),
                                                                  ),
                                                                  side: BorderSide(color: K.primaryColor)
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
                                          } );
                                    }
                                ),
                              ),

                              // SizedBox(
                              //   height: 220,
                              //   child: ListView.builder(
                              //     scrollDirection: Axis.horizontal,
                              //     itemCount: 5,
                              //     itemBuilder: (context, index){
                              //       return Container(
                              //         width: 180,
                              //         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                              //         decoration: BoxDecoration(
                              //             color: Colors.white,
                              //             borderRadius: BorderRadius.circular(8),
                              //             boxShadow: const [BoxShadow(
                              //               color: Colors.grey,
                              //               spreadRadius: -1.2, // Negative value to contain the shadow within the border
                              //               blurRadius: 2,
                              //               offset: Offset(0, 2),
                              //             )]
                              //         ),
                              //         child: Padding(
                              //           padding: const EdgeInsets.all(15.0),
                              //           child: Column(
                              //             mainAxisAlignment: MainAxisAlignment.center,
                              //             children: [
                              //               const Row(
                              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Icon(Icons.favorite, color: Colors.red,),
                              //                   Row(
                              //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //                     children: [
                              //                       Icon(Icons.star, color: Color(0xff0EBE7F),),
                              //                       SizedBox(width: 5,),
                              //                       Text("4.0", style: TextStyle(
                              //                           color: Colors.grey,
                              //                           fontSize: 15,
                              //                           fontWeight: FontWeight.w400
                              //                       ),)
                              //                     ],
                              //                   ),
                              //                 ],
                              //               ),
                              //               Image.asset("assets/images/featuredDoctor1.png", width: 80, height: 80,),
                              //               const Padding(
                              //                 padding: EdgeInsets.only(top: 12.0),
                              //                 child: Text("Dr. Mitanshi",
                              //                   maxLines: 2,
                              //                   style:  TextStyle(
                              //                       fontWeight: FontWeight.w500,
                              //                       color: Color(0xff414040),
                              //                       fontSize: 17
                              //                   ),
                              //                 ),
                              //               ),
                              //               Padding(
                              //                 padding: const EdgeInsets.only(top: 3.0),
                              //                 child: Row(
                              //                   mainAxisAlignment: MainAxisAlignment.center,
                              //                   children: [
                              //                     RichText(text: const TextSpan(
                              //                       text: "₹",
                              //                       style: TextStyle(
                              //                           color:  Color(0xff0EBE7F),
                              //                           fontWeight: FontWeight.w500
                              //                       ),
                              //
                              //                     )),
                              //                     RichText(text: const TextSpan(
                              //                       text: "500/hour",
                              //                       style: TextStyle(
                              //                           color:  Colors.grey,
                              //                           fontWeight: FontWeight.w400
                              //                       ),
                              //
                              //                     )),
                              //                   ],
                              //                 ),
                              //               )
                              //             ],
                              //           ),
                              //         ),
                              //       );},
                              //
                              //
                              //   ),
                              // ),



                              SizedBox(height: 40,),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 120,
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
                  // Your home screen content here
                );
              }
            },
          ),
        ),
      ),
    );
  }}
