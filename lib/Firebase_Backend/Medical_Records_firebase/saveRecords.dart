import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SavingRecords{
  File? image;
  TextEditingController record_for = TextEditingController();
  String typeOfRecord = "";
  TextEditingController Date = TextEditingController();
  bool loading =false;

  void saveRecords() async {
    try {
      String? img = image?.path;
      String record_name = record_for.text.trim(),
          record_type = typeOfRecord,
          date = Date.text.trim();

      if (img!.isNotEmpty && record_name.isNotEmpty && record_type.isNotEmpty && date.isNotEmpty) {
        Map<String, dynamic> data = {
          "date": date,
          "image": img,
          "record_name": record_name,
          "record_type": record_type,
        };
        loading = true;
        await FirebaseFirestore.instance.collection("DoctorHunt").add(data);
      }
    }
    catch (e) {
      // loading = false;
      print("Data not added in the fire store  because of $e");
    }
  }



}