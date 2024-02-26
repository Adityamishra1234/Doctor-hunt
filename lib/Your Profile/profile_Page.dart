import 'dart:io';

// import 'package:doctor_hunt/UIhelper.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/UiHelperTextField.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget{
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController Dob = TextEditingController();
  TextEditingController location = TextEditingController();
  late FocusNode _namefocusNode = FocusNode();
  late FocusNode _numberfocusNode = FocusNode();
  late FocusNode _DobfocusNode = FocusNode();
  late FocusNode _locationfocusNode = FocusNode();
  late OutlineInputBorder _namefocusNodeBorder;
  late OutlineInputBorder _numberfocusNodeBorder;
  late OutlineInputBorder _DobfocusNodeBorder;
  late OutlineInputBorder _locationfocusNodeBorder;

  Color lock = Colors.black45;
  Color email1 = Colors.black45;
  Color name1 = Colors.black45;
  Color number1 = Colors.black45;
  Color Dob1 = Colors.black45;
  Color location1 = Colors.black45;

  String selected = "";
  File? profilePic;

  @override
  void initState() {
    _namefocusNode = FocusNode();
    _numberfocusNode = FocusNode();
    _DobfocusNode = FocusNode();
    _locationfocusNode = FocusNode();
    _namefocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _numberfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _DobfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _locationfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }
File? image;
  Future<void> _getImage() async{
    final pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        image =  File(pickedFile.path);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgcommon.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // height: 360,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        color: Color(0xff0EBE7F),
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(30), bottomLeft: Radius.circular(30))
                    ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: AppBarHeader("Profile", () {
                                Navigator.of(context).pop();
                              }),
                            ),
                            const SizedBox(height: 3),
                            Container(
                              margin: const EdgeInsets.only(top :40,bottom: 25),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text("Set up your profile" ,textAlign: TextAlign.center, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600 , color: CupertinoColors.white),),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(textAlign: TextAlign.center,"Update your profile to connect your doctor with better impression." , style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500 , color: Colors.white),),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  GestureDetector(
                                    onTap: (){
                                      _getImage();
                                    },
                                    child: CircleAvatar(
                                    radius: 60,
                                    backgroundImage: (image!=null) ? FileImage(image!) : null,
                                    backgroundColor: Colors.grey,
                                      ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                    ),
                  const SizedBox(
                    height: 10,
                  ),

                  //text fields
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                    child: SizedBox(
                        width:double.infinity,
                        child: Focus(
                          onFocusChange: (bool hasFocus){
                            setState(() {
                              name1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                              _namefocusNodeBorder = hasFocus
                                  ? OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0EBE7F),
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
                            focusNode: _namefocusNode,
                            controller: name,
                            obscureText: true,
                            cursorColor: const Color(0xff0EBE7F),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_person, color: lock),
                              suffixIcon: Icon(Icons.edit, color: Colors.grey,),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: _namefocusNodeBorder,
                              focusedBorder: _namefocusNodeBorder,
                              hintText: "Name Here",
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                    child: SizedBox(
                        width:double.infinity,
                        child: Focus(
                          onFocusChange: (bool hasFocus){
                            setState(() {
                              number1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                              _numberfocusNodeBorder = hasFocus
                                  ? OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0EBE7F),
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
                            focusNode: _numberfocusNode,
                            controller: number,
                            obscureText: true,
                            cursorColor: const Color(0xff0EBE7F),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_person, color: lock),
                              suffixIcon: Icon(Icons.edit, color: Colors.grey,),


                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: _numberfocusNodeBorder,
                              focusedBorder: _numberfocusNodeBorder,
                              hintText: "Number",
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                    child: SizedBox(
                        width:double.infinity,
                        child: Focus(
                          onFocusChange: (bool hasFocus){
                            setState(() {
                              Dob1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                              _DobfocusNodeBorder = hasFocus
                                  ? OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0EBE7F),
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
                            focusNode: _DobfocusNode,
                            controller: Dob,
                            obscureText: true,
                            cursorColor: const Color(0xff0EBE7F),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_person, color: lock),
                              suffixIcon: Icon(Icons.edit, color: Colors.grey,),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: _DobfocusNodeBorder,
                              focusedBorder: _DobfocusNodeBorder,
                              hintText: "Date of birth",
                            ),
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                    child: SizedBox(
                        width:double.infinity,
                        child: Focus(
                          onFocusChange: (bool hasFocus){
                            setState(() {
                              location1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                              _locationfocusNodeBorder = hasFocus
                                  ? OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0EBE7F),
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
                            focusNode: _locationfocusNode,
                            controller: location,
                            obscureText: true,
                            cursorColor: const Color(0xff0EBE7F),
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock_person, color: lock),
                              suffixIcon: Icon(Icons.edit, color: Colors.grey,),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: _locationfocusNodeBorder,
                              focusedBorder: _locationfocusNodeBorder,
                              hintText: "Address Here",
                            ),
                          ),
                        )),
                  ),


                  // Container(
                  //   width: 330,
                  //   height: 315,
                  //   // color: Colors.blue,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const Text("Personal information" , style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                  //       UiHelper.CustomTextField(nameController ,"Name",  "Enter Your Name", Icons.edit),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       UiHelper.CustomTextField(contactController, "Contact Number", "Number", Icons.edit),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       UiHelper.CustomTextField(dateOfBirthController, "Date Of Birth", "DD MM YY", Icons.edit),
                  //       const SizedBox(
                  //         height: 10,
                  //       ),
                  //       UiHelper.CustomTextField(locationController, "Location", "Add Address", Icons.edit),
                  //     ],
                  //   ),
                  // ),


                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 18.0,left: 18,top: 10),
                    child: LoginButton(title: "Continue", onTap: (){

                    },),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),




    );
  }
}