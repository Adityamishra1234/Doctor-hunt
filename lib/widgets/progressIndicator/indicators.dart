import 'package:flutter/material.dart';

void showProgressDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: CircularProgressIndicator(
          color: Color(0xff0EBE7F),
        ),
      );
    },
  );
}

void hideProgressDialog(BuildContext context) {
  Navigator.of(context, rootNavigator: true).pop();
}