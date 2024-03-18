import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/Firebase_Backend/Medical_Records_firebase/saveRecords.dart';
import 'package:doctor_hunt/More/moreBar.dart';
import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../widgets/AppBarHeader.dart';
import '../widgets/customButton.dart';
import 'add_Records_patients.dart';

class AllRecords extends StatefulWidget {
  final VoidCallback? onReturn;
  const AllRecords({super.key, this.onReturn});

  @override
  State<AllRecords> createState() => _AllRecordsState();
}

class _AllRecordsState extends State<AllRecords> {
  String? _selectedItem;

  void goBackToProfileScreen(BuildContext context) {
    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyHomePage()));
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        goBackToProfileScreen(context);
        return false;
      },
      child: Scaffold(
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
                          goBackToProfileScreen(context);
                        }),
                      ),
                      Expanded(
                        child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance.collection("All Records").snapshots(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.active) {
                              if (snapshot.hasData && snapshot.data != null) {
                                if (snapshot.data!.docs.isNotEmpty) {
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
                                                            fontSize: 16,
                                                            fontFamily: 'Lato'
                                                        )),
                                                        Text("Record for ${recordData['record_name']}", style: TextStyle(
                                                            color: Color(0xff0EBE7F),
                                                            fontSize: 12,
                                                            fontFamily: 'Lato'
                                                        ),),
                                                        SizedBox(height: 8,),
                                                        Text(" ${recordData['record_type']} ", style: TextStyle(
                                                            color: Colors.grey,
                                                            fontFamily: 'Lato'
                                                        ),),
                                                      ],
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          PopupMenuButton<String>(
                                                            onSelected: (result){
                                                              setState(() {
                                                                _selectedItem = result;
                                                              });
                                                              if(_selectedItem == "Delete Record"){
                                                                deleteRecord(index);
                                                                // FirebaseFirestore.instance.collection("DoctorHunt").doc().id.delete();
                                                              }
                                                              else if(_selectedItem == "View Image"){
                                                                showDialog(
                                                                  context: context,
                                                                  builder: (BuildContext context) {
                                                                    return Dialog(
                                                                      child: Container(
                                                                        width: MediaQuery.of(context).size.width * 0.8,
                                                                        height: MediaQuery.of(context).size.height * 0.6,
                                                                        child: PhotoView(
                                                                          imageProvider: NetworkImage("${recordData['image']}"),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              }
                                                            },
                                                            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                                                              PopupMenuItem(
                                                                value: "Delete Record",
                                                                child:Container(
                                                                  height: 18, // Set the height of the menu item
                                                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons.delete, color: const  Color(0x900EBE7F)), // Custom icon
                                                                      SizedBox(width: 10), // Spacer
                                                                      Text('Delete Record', style: TextStyle(color: Colors.black54)), // Custom text style
                                                                    ],
                                                                  ),
                                                                ),),
                                                              PopupMenuItem(
                                                                value: "View Image",
                                                                child: Container(
                                                                  height: 18, // Set the height of the menu item
                                                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Icon(Icons.image, color: const  Color(0x900EBE7F)), // Custom icon
                                                                      SizedBox(width: 10), // Spacer
                                                                      Text('View Image', style: TextStyle(color: Colors.grey[600])), // Custom text style
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                            child: IconButton(onPressed: null, icon: Icon(Icons.more_vert_rounded, color: Colors.grey,),),
                                                          ),
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
                                else {
                                  return Center(
                                    child: CircularProgressIndicator(color: const Color(0xff0EBE7F)),
                                  );
                                }
                              } else {
                                return Center(
                                  child: Text(
                                    "No Records Found",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Lato'
                                    ),
                                  ),
                                );
                              }
                            } else {
                              return Center(child: CircularProgressIndicator(color: const Color(0xff0EBE7F)));
                            }
                          },
                        ),
                      )

                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: LoginButton(
                        title: "Add a record",
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const PatientRecords())); //Change here the class of add records
                        },
                      ),
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }

  void deleteRecord(int index){
    FirebaseFirestore.instance.collection("All Records").get().then((querySnapshot) {
      if (querySnapshot.size > index) {
        // Check if the index is within the range of documents
        var documentSnapshot = querySnapshot.docs[index];
        var documentId = documentSnapshot.id; // Get the document ID
        FirebaseFirestore.instance.collection("All Records").doc(documentId).delete();
      } else {
        print("Index out of range");
      }
    }).catchError((error) {
      print("Error getting documents: $error");
    });
  }
}
