
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/All_Doctors/doctors.dart';
import 'package:doctor_hunt/Help_center/help_center.dart';
import 'package:doctor_hunt/Medical_Records/add_records.dart';
import 'package:doctor_hunt/Medicine_Orders/noOrder.dart';
import 'package:doctor_hunt/More/moreModel/moreModel.dart';
import 'package:doctor_hunt/Settings/settings.dart';
import 'package:doctor_hunt/Test_Bookings/No_test_bookings.dart';
import 'package:doctor_hunt/Your%20Profile/profile_Page.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Firebase_Backend/auth/userProvider.dart';
import '../Medical_Records/All_records.dart';
import '../auth/login.dart';
import '../widgets/CachedImageView.dart';

class ProfileScreen extends StatefulWidget {
  static const route = "/ProfileScreen";

  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late SharedPreferences _pref;


// List<Map<String, dynamic>> morebar = [
//     {'imag': "assets/images/yoga_podcast.png", 'title': "Your Profile"},
//     {'imag': "assets/images/meditation_podcast.png", 'title': "My Doctors "},
//     {'imag': "assets/images/sadhna_podcast.png", 'title': "Medical Records"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Payments"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Medicine Orders"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Test Bookings"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Help Center"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Setting"},
//     {'imag': "assets/images/programs_podcast.png", 'title': "Logout"},
//   ];


  Future<void> signOut() async{
    FirebaseAuth.instance.signOut();
    Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login()));
    Navigator.popUntil(context, (route) => route.isCurrent);
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userName = userProvider.userName;
    final userEmail = userProvider.userEmail;
    final userProfile = userProvider.userPhotoUrl;
    final userNumber = userProvider.userNumber;
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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: AppBarHeader("More", () {
                  Navigator.of(context).pop();
                },
                    isBack : false,
                ),
              ),
              const SizedBox(height: 3),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(
                      colors: [
                        const Color(0xffFFFFFF),
                        const Color(0x800EBE7F),
                        const Color(0x200EBE7F),
                        const Color(0x800EBE7F),
                        const Color(0xffFFFFFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    // color: const Color(0x500EBE7F),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: -2, // Negative value to contain the shadow within the border
                        blurRadius: 9,
                        offset: const Offset(0, 5),
                      )
                    ]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(26),
                            color: Colors.transparent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: -2, // Negative value to contain the shadow within the border
                                blurRadius: 9,
                                offset: const Offset(0, 6),
                              )
                            ]
                        ),
                        child: Container(
                          width: 60,
                          height: 60,
                          color: Colors.transparent,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: CachedImageView(
                              image: "${userProfile}",
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
                      const SizedBox(height: 8,),
                      Text("${userName}", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        fontFamily: 'Abhaya'
                      ),),
                      // Text("", style: TextStyle(
                      //   fontWeight: FontWeight.w500,
                      //   fontSize: 15,
                      // ),),
                      Text("${userEmail}", style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        fontFamily: 'Lato'
                      ),),
                      const SizedBox(height: 8,),
                      // const Icon(Icons.edit_note, size : 30,color:Colors.white)

                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: morebar.length,
                  itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      if(index==0){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const doctors()));
                      }
                      // else if(index==0){
                      //   // Navigator.push(context,
                      //   //     MaterialPageRoute(builder: (context) => const ProfilePage()));
                      // }
                      else if(index==1) {
                        FirebaseFirestore.instance.collection("All Records").get().then((querySnapshot) {
                          if (querySnapshot.docs.isNotEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const AllRecords()),
                            );
                          } else {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => const AddRecords()));
                          }
                        }).catchError((error) {
                          print("Error getting documents: $error");
                          // Handle error
                        });
                      }
                      else if(index == 3){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NoOrderMedicine()));
                      }
                      else if(index == 4){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const NoTestBooking()));
                      }
                      else if(index==5){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const HelpCenter()));
                      }
                      else if(index==6){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const Setting()));
                      }
                      else if(index==7){
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: const Text("Log out"),
                                  content: const Text(
                                      "Are you sure you want to logout?"),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        signOut();
                                        },
                                      //async {SharedPreferences pref = await SharedPreferences.getInstance().pref.clear();Navigator.of(context).pushNamedAndRemoveUntil(LoginPage.route, (route) => false);
                                      child: const Text(
                                        "Yes",
                                        style: TextStyle(
                                            color: Color(0xff0EBE7F),
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop(false);
                                      },
                                      child: const Text(
                                        "Cancel",
                                        style: TextStyle(
                                          color: Color(0xffEB5757),

                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              });
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5, left: 5, top: 5,bottom: 5),
                        child: ListTile(
                          leading: Container(
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
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: morebar[index].image,
                          ),),
                          title:  Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${morebar[index].discription}"),
                          ),
                          trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey,),
                        ),
                      ),
                    ),
                  );
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}


