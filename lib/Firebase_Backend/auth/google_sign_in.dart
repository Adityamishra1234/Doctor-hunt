import 'package:doctor_hunt/Firebase_Backend/auth/userProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/bottom_navigation_bar.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle(BuildContext context) async {
  try {
    // Trigger the Google Sign In flow
    final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      // Obtain the GoogleSignInAuthentication object
      final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      // Create a new credential
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      // Sign in to Firebase with the Google credentials
      final UserCredential authResult = await _auth.signInWithCredential(credential);
      final User? user = authResult.user;

      if (user != null) {
        Provider.of<UserProvider>(context, listen: false).loadUserData();
        print('User Name: ${user.displayName}');
        print('User Email: ${user.email}');
        print('User Photo URL: ${user.photoURL}');
        await _saveUserData(user.displayName, user.email, user.photoURL, user.phoneNumber);
        // Navigate to the home page after successful sign-in
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      } else {
        throw FirebaseAuthException(message: 'Failed to sign in with Google', code: '');
      }
    } else {
      // User canceled the sign-in process
      throw FirebaseAuthException(message: 'Sign in with Google canceled', code: '');
    }
  } catch (e) {
    // Handle errors
    print('Failed to sign in with Google: $e');
    // You can show a snackbar or toast to inform the user about the error
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Failed to sign in with Google')));
  }

}

Future<void> _saveUserData(String? name, String? email, String? photoUrl, String? phoneNumber) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('userName', name ?? '');
  await prefs.setString('userEmail', email ?? '');
  await prefs.setString('userPhotoUrl', photoUrl ?? '');
  await prefs.setString('userNumber', phoneNumber ?? '');
}

