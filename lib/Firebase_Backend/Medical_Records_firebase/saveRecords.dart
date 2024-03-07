import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SavingRecords{
  File? image;
  TextEditingController record_for = TextEditingController();
  String typeOfRecord = "";
  TextEditingController Date = TextEditingController();
  bool loading = false;

  void saveRecords() async {
    try {
      File? img = image;
      String record_name = record_for.text.trim(),
          record_type = typeOfRecord,
          date = Date.text.trim();

      if (img!=null && record_name.isNotEmpty && record_type.isNotEmpty && date.isNotEmpty) {
        SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
        UploadTask uploadTask =  FirebaseStorage.instance.ref().child("Record Image").child(Uuid().v1()).putFile(img,metadata);
        TaskSnapshot taskSnapshot = await uploadTask;
        String downloadUrl = await taskSnapshot.ref.getDownloadURL();

        Map<String, dynamic> data = {
          "date": date,
          "image": downloadUrl,
          "record_name": record_name,
          "record_type": record_type,
        };
        loading = true;
        await FirebaseFirestore.instance.collection("All Records").add(data);
      }
      else{
        //write else condition here aditya that if..anything is empty...it should not move to the next screen..Basically validation.
      }
    }
    catch (e) {
      // loading = false;
      print("Data not added in the fire store  because of $e");
    }
  }



}