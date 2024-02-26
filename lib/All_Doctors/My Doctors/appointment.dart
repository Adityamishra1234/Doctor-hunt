// import 'dart:html';

import 'dart:io';

import 'package:doctor_hunt/All_Doctors/My%20Doctors/my_doctors.dart';
import 'package:doctor_hunt/All_Doctors/My%20Doctors/select_time.dart';
import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:image_picker/image_picker.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
import 'package:quickalert/quickalert.dart';

// import 'My Doctors/my_doctors.dart';

class Appointment extends StatefulWidget {
  const Appointment({super.key});
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {

  TextEditingController date = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late FocusNode _emailfocusNode = FocusNode();
  late FocusNode _datefocusNode = FocusNode();
  late FocusNode _passwordfocusNode = FocusNode();
  late OutlineInputBorder _emailfocusNodeBorder;
  late OutlineInputBorder _datefocusNodeBorder;
  late OutlineInputBorder _passwordfocusNodeBorder;

  Color lock = Colors.black45;
  Color email1 = Colors.black45;

  String selected = "";

  DateTime selectedDate = DateTime.now();
  Color calendar = Color(0xff0EBE7F);
  File? _image;

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    _datefocusNode = FocusNode();

    _emailfocusNode = FocusNode();
    _passwordfocusNode = FocusNode();

    _datefocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      )
    );
    _emailfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _passwordfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }

  //top snack bar
  // void showCustomSnackBar(BuildContext context, String message, Color backgroundColor) {
  //   final snackBar = SnackBar(
  //     content: Text(
  //       message,
  //       style: TextStyle(color: Colors.white),
  //     ),
  //     backgroundColor: backgroundColor,
  //   );
  //
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }

 //for date selection
  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor:const Color(0xff0EBE7F), // Your custom color
            hintColor: const  Color(0xff0EBE7F),// Your custom color
            colorScheme: ColorScheme.light(primary: Color(0xff0EBE7F)),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        date.text = "${picked.toLocal()}".split(' ')[0];
      });
    }
  }



  void showAlert(QuickAlertType quickAlertType){
    QuickAlert.show(
        context: context,
        title: "Thank You !",
        text: "Your Appointment Successful\n\n You booked and appointment with Dr. Mishra on February 20,2024 at 4:00 PM ",
        textColor: Colors.grey,
        showConfirmBtn: false,
        showCancelBtn: false,
        titleColor: CupertinoColors.black,
        borderRadius: 30,
        widget: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: AnimatedContainer(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0x700EBE7F)),
                    color: Color(0x50FFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(5),
                    ),),
                  duration: Duration(milliseconds: 200),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0, bottom: 15, right: 25, left: 25),
                    child: Center(child: Text("Edit Details",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff0EBE7F)
                    ),),),
                  ),
                ),
              ),
              LoginButton(title: "Done", onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(
                        builder:
                            (context)=>MyHomePage()));

                // showCustomSnackBar(context, "Success!", const  Color(0xff0EBE7F),);
              },),

            ],
          ),
        ),
        // disableBackBtn: true,
        // headerBackgroundColor: const  Color(0xff0EBE7F),
        type: quickAlertType,
    );
  }

  // void showAlert(QuickAlertType quickAlertType) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text("Thank You!"),
  //         content: Text("Your Appointment Was Successful\n\nYou booked an appointment with Dr. Mishra on February 20, 2024, at 4:00 PM"),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop(); // Close the alert
  //             },
  //             style: ElevatedButton.styleFrom(
  //               primary: const Color(0xff0EBE7F),
  //             ),
  //             child: Text("Done"),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  Future<void> _getImage() async{
    final pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        _image =  File(pickedFile.path);
      }
    });
  }


  @override
  void dispose(){
    _emailfocusNode.dispose();
    _passwordfocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                    child: AppBarHeader("Appointment", () {
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
                            SizedBox(height: 10,),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Appointment For", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),),
                            const SizedBox(height: 20),

                            //text fields
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 15,left: 10),
                              child: SizedBox(
                                  width:double.infinity,
                                  child: Focus(
                                    onFocusChange: (bool hasFocus){
                                      setState(() {
                                        email1 = hasFocus? Color(0xff0EBE7F):Colors.grey;
                                        _emailfocusNodeBorder = hasFocus ? OutlineInputBorder(borderSide: const BorderSide(color: Color(0xff0EBE7F),
                                          ),
                                          borderRadius: BorderRadius.circular(8.0),
                                        )
                                            : OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Colors.grey,
                                          ),
                                          borderRadius: BorderRadius.circular(8.0),
                                        );
                                      });
                                    },
                                    child: TextField(
                                      focusNode: _emailfocusNode,
                                      controller: email,
                                      cursorColor: const Color(0xff0EBE7F),
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.drive_file_rename_outline,color: email1),
                                        filled: true,
                                        fillColor: Colors.white,
                                        enabledBorder: _emailfocusNodeBorder,
                                        focusedBorder: _emailfocusNodeBorder,
                                        hintText: "Patient Name",
                                      ),
                                    ),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 15,left: 10, bottom: 8),
                              child: SizedBox(
                                  width:double.infinity,
                                  child:TextFormField(
                                    focusNode: _passwordfocusNode,
                                    controller: password,
                                    cursorColor: const Color(0xff0EBE7F),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.numbers_sharp, color: lock),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      focusedBorder:  OutlineInputBorder(
                                        borderSide: BorderSide(color: Color(0xff0EBE7F)),
                                        borderRadius: BorderRadius.circular(8.0),
                                      ),
                                      hintText: "Contact Number",
                                    ),
                                  ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0, right: 15,left: 10),
                              child: SizedBox(
                                  width:double.infinity,
                                  child: TextFormField(
                                    focusNode: _datefocusNode,
                                    controller: date,
                                    cursorColor: const Color(0xff0EBE7F),
                                    onTap: (){
                                      _selectDate(context);
                                    },
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.calendar_month_sharp,color: email1),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: _datefocusNodeBorder,
                                      focusedBorder: _datefocusNodeBorder,
                                      hintText: "Select Date",
                                    ),
                                  ),
                              ),
                            ),
                            const SizedBox(height: 20),


                            //gallery image
                            Text("Who is this Patient", style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),),
                            const SizedBox(height: 20),

                               Row(
                            children: [
                              AnimatedContainer(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color:  Color(0x200EBE7F),
                                ),
                                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                                height: 115,
                                duration: Duration(milliseconds: 200),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children:[
                                      IconButton(onPressed: (){
                                        _getImage();
                                        //add gallery opening and adding image on the screen functionality aditya
                                      }, icon: Icon(Icons.add, color:  Color(0xff0EBE7F),size: 45,)),
                                      Text("Add an Image", style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                        color:  Color(0xff0EBE7F),
                                      ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if(_image !=null)
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                                  height: 110,
                                  child: Image.file(_image! as File,height: 130,width: 110,fit: BoxFit.cover,),
                                )

                            ],
                          ),
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0, left: 15),
                              child: LoginButton(onTap: (){
                                showAlert(QuickAlertType.success);
                              }, title: "Confirm",),
                            ),





                          ],
                        ),
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
