// import 'dart:html';

import 'dart:io';

import 'package:doctor_hunt/Firebase_Backend/Medical_Records_firebase/saveRecords.dart';
import 'package:doctor_hunt/Medical_Records/All_records.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class PatientRecords extends StatefulWidget {
  const PatientRecords({super.key});

  @override
  State<PatientRecords> createState() => _PatientRecordsState();
}

class _PatientRecordsState extends State<PatientRecords> {

  TextEditingController name = TextEditingController();
  TextEditingController date = TextEditingController();
  File? image;
  DateTime selectedDate = DateTime.now();



  void getImage() async{
    final pickedFile = await ImagePicker().pickImage(source:ImageSource.gallery);
    setState(() {
      if(pickedFile != null){
        image =  File(pickedFile.path);
        obj.image =  File(pickedFile.path);
      }
    });
  }
  Future<void> selectDate(BuildContext context) async {
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
            colorScheme: const ColorScheme.light(primary: Color(0xff0EBE7F)),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        final formattedDate = DateFormat("d MMM, yyyy").format(picked);
        obj.Date.text = formattedDate;
      });

    }
  }



 SavingRecords obj = SavingRecords();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
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
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: AppBarHeader("Add Records", () {
                  Navigator.of(context).pop();
                }),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
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
                                    getImage();
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
                          if(image !=null)
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 2),
                              height: 110,
                              child: Image.file(image!,height: 130,width: 110,fit: BoxFit.cover,),
                            )

                        ],
                      ),

                      const SizedBox(height: 100,),
                      // Spacer(),
                      Container(
                        width: double.infinity,
                        height: 560,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.9),
                                spreadRadius: -1, // Negative value to contain the shadow within the border
                                blurRadius: 15,
                                offset: const Offset(0, 10),
                              )
                            ],
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(30),topLeft:Radius.circular(30) ),
                          color: Colors.white
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Record for", style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                              ),),
                              const SizedBox(height: 5,),
                              TextField(
                                controller: obj.record_for,
                                cursorColor: const Color(0xff0EBE7F),
                                style: const TextStyle(
                                  color: Color(0xff0EBE7F),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20

                                ),
                                decoration: const InputDecoration(
                                    prefixIcon: Icon(Icons.person_outlined,color: Color(0xff0EBE7F),),
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: "Type Here",
                                    hintStyle: TextStyle(
                                        color: Colors.grey,
                                      fontSize: 15
                                    ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Divider(
                                height: 20,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 20,),
                              const Text("Type of record", style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize:18
                              ),),
                              const SizedBox(height: 5,),
                              Padding(
                                padding: const EdgeInsets.only(right: 20.0,left: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              obj.typeOfRecord = "Report";
                                            },
                                            icon: Image.asset("assets/images/reports.png",scale: 0.8,)),
                                        const Text("Report", style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              obj.typeOfRecord = "Prescription";
                                            },
                                            icon: Image.asset("assets/images/reports.png",scale: 0.8)),
                                        const Text("Prescription", style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                        ),),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                            onPressed: (){
                                              obj.typeOfRecord = "Invoice";
                                            },
                                            icon: Image.asset("assets/images/reports.png",scale: 0.8)),
                                        const Text("Invoice", style: TextStyle(
                                            color: Colors.black45,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15
                                        ),),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Divider(
                                height: 20,
                                color: Colors.grey[300],
                              ),
                              const SizedBox(height: 20,),
                              const Text("Record Created On", style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18
                              ),),
                              const SizedBox(height: 5,),
                              TextField(
                                controller: obj.Date,
                                onTap: (){
                                  selectDate(context);
                                },
                                cursorColor: const Color(0xff0EBE7F),
                                readOnly: true,
                                style: const TextStyle(
                                    color: Color(0xff0EBE7F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18

                                ),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.calendar_month_sharp,color: Color(0xff0EBE7F),),
                                  fillColor: Colors.white,
                                  border: InputBorder.none,
                                  hintText: "Select Date",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                              const SizedBox(height: 5,),
                              Divider(
                                height: 20,
                                color: Colors.grey[300],
                              ),

                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: LoginButton(title: "Upload record",
                                  onTap: () async {
                                   obj.saveRecords();
                                      Future.delayed(Duration(milliseconds: 300), (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const AllRecords()));
                                  });
                                },
                                  loading: obj.loading,
                                ),
                              )

                            ],
                          ),
                        ),
                      )

                    ],
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
