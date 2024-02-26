
import 'package:doctor_hunt/All_Doctors/doctors.dart';
import 'package:doctor_hunt/Medical_Records/add_Records_patients.dart';
import 'package:doctor_hunt/More/moreModel/moreModel.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/material.dart';

class AddRecords extends StatefulWidget {
  static const route = "/ProfileScreen";

  const AddRecords({Key? key}) : super(key: key);

  @override
  State<AddRecords> createState() => _AddRecordsState();
}

class _AddRecordsState extends State<AddRecords> {
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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: AppBarHeader("Medical Records", () {
                  Navigator.of(context).pop();
                }),
              ),
              Expanded(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/noRecords.png", scale: 3.5,),
                        const SizedBox(height: 35,),
                        const Text("Add a Medical Record.", textAlign:TextAlign.center,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),),
                        const SizedBox(height: 10,),
                        const Text("A detailed health history helps a doctor to diagnose you better.", maxLines: 4,textAlign:TextAlign.center,style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: Colors.grey,
                          overflow: TextOverflow.ellipsis
                        ),),
                        const SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: LoginButton(title: "Add a Record", onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientRecords())); //Change here the class of add records
                          },),
                        )
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


