import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_hunt/Medical_Records/add_Records_patients.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../Medical_Records/All_records.dart';
import '../../More/moreBar.dart';
import '../../widgets/progressIndicator/indicators.dart';
import '../../widgets/top_snackbar/top_snack_bar.dart';

class SavingRecords {
  File? image;
  TextEditingController record_for = TextEditingController();
  String typeOfRecord = "";
  TextEditingController Date = TextEditingController();
  bool loading = false;
  void Function() resetStateCallback;

  SavingRecords({required this.resetStateCallback});

  Future<void> saveRecords(BuildContext context) async {
    try {
      File? img = image;
      String record_name = record_for.text.trim();
      String record_type = typeOfRecord;
      String date = Date.text.trim();

      if (img == null || record_name.isEmpty || record_type.isEmpty || date.isEmpty) {
        showTopSnackBar(
          context,
          CustomSnackBar.info(message: "All Fields are mandatory"),
          showOutAnimationDuration: const Duration(milliseconds: 800),
          hideOutAnimationDuration: const Duration(milliseconds: 800),
          displayDuration: const Duration(milliseconds: 1500),
        );
        // resetStateCallback();
        return;
      }
      showProgressDialog(context);
      SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
      UploadTask uploadTask = FirebaseStorage.instance.ref().child("Record Image").child(Uuid().v1()).putFile(img, metadata);
      TaskSnapshot taskSnapshot = await uploadTask;
      String downloadUrl = await taskSnapshot.ref.getDownloadURL();

      Map<String, dynamic> data = {
        "date": date,
        "image": downloadUrl,
        "record_name": record_name,
        "record_type": record_type,
      };
      await FirebaseFirestore.instance.collection("All Records").add(data);
      loading = true;
      Future.delayed(const Duration(milliseconds: 300), () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AllRecords(onReturn: resetStateCallback)),
        );
      });
    } catch (e) {
      print("Data not added in the Firestore because of $e");
    }
  }

// void navigateToAllRecordsScreen() {
//   Navigator.push(
//     context as BuildContext,
//     MaterialPageRoute(builder: (context) => AllRecords()),
//   );
// }
}
