import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  late String userName = "";
  late String userEmail = "";
  late String userPhotoUrl = "";
  late String userNumber = "";

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
    userEmail = prefs.getString('userEmail') ?? '';
    userPhotoUrl = prefs.getString('userPhotoUrl') ?? '';
    userNumber = prefs.getString('userNumber') ?? '';
    notifyListeners();
  }

  Future<void> loadUserDataWithFuture() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName = prefs.getString('userName') ?? '';
    userEmail = prefs.getString('userEmail') ?? '';
    userPhotoUrl = prefs.getString('userPhotoUrl') ?? '';
    userNumber = prefs.getString('userNumber') ?? '';
    // notifyListeners();
  }



// Your other provider methods
}
