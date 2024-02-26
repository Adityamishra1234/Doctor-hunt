import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/Medical_Records/add_Records_patients.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../widgets/AppBarHeader.dart';

class AllRecords extends StatefulWidget {
  const AllRecords({super.key});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
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
          child: Stack(
            children: [
              Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                  child: AppBarHeader("All Records", () {
                    Navigator.of(context).pop();
                  }),
                ),
                Expanded(
                  child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection("DoctorHunt").snapshots(),
                    builder: (context, snapshot) {

                      if(snapshot.connectionState == ConnectionState.active){
                        if(snapshot.hasData && snapshot.data !=null){
                          return ListView.builder(
                            itemCount: snapshot.data?.docs.length,
                            itemBuilder: (BuildContext context, int index) {

                              Map<String, dynamic>recordData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                              return AnimatedContainer(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: -1, // Negative value to contain the shadow within the border
                                        blurRadius: 10,
                                        offset: const Offset(0, 6),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(10),
                                    color:  Colors.white,
                                  ),
                                  margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                                  duration: const Duration(milliseconds: 200),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Column(
                                              children: [
                                                AnimatedContainer(
                                                  height:55,
                                                  width: 55,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color:  Color(0xff0EBE7F),
                                                  ),
                                                  margin: const EdgeInsets.symmetric(vertical: 10,),
                                                  duration: const Duration(milliseconds: 200),
                                                  child: Center(
                                                    child: Text("${recordData['date'].substring(0,6)}",textAlign:TextAlign.center,style: TextStyle(
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  ),
                                                ),
                                                AnimatedContainer(
                                                  width: 55,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(5),
                                                    color:   Color(0x100EBE7F),
                                                  ),
                                                  duration: const Duration(milliseconds: 200),
                                                  child: Center(
                                                    child: Text("New",textAlign:TextAlign.center,style: TextStyle(
                                                        color:  Color(0xff0EBE7F),
                                                        fontWeight: FontWeight.bold
                                                    ),),
                                                  ),
                                                ),
                                              ],

                                            ),
                                            const SizedBox(width: 15,),
                                             Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Text("Records added",style: TextStyle(
                                                    color:Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16
                                                )),
                                                Text("Record for ${recordData['record_name']}", style: TextStyle(
                                                    color: Color(0xff0EBE7F),
                                                    fontSize: 12
                                                ),),
                                                SizedBox(height: 8,),
                                                Text(" ${recordData['record_type']} ", style: TextStyle(
                                                    color: Colors.grey
                                                ),),
                                              ],
                                            ),
                                            Expanded(
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  IconButton(onPressed: (){
                                                  }, icon: Icon(Icons.more_vert_rounded, color: Colors.grey,),),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),

                                      ],
                                    ),
                                  )
                              );
                            },
                          );
                        }
                        else{
                          return Center(child: Text("No Records Found", style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                          ),),);
                        }
                      }
                      else{
                        return CircularProgressIndicator(color: const  Color(0xff0EBE7F));
                      }
                    }
                  ),
                ),
              ],
            ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LoginButton(title: "Add a record", onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientRecords())); //Change here the class of add records

                  },),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }
}
