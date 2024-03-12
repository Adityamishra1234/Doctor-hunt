import 'package:flutter/material.dart';

class AppBarHeader extends StatefulWidget {
  String title;
  VoidCallback? onTap;
  bool isBack;
  Color color;
  AppBarHeader(this.title, this.onTap,{this.isBack=true, this.color = Colors.black});

  @override
  State<AppBarHeader> createState() => _AppBarHeaderState();
}

class _AppBarHeaderState extends State<AppBarHeader> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        widget.isBack?GestureDetector(
          onTap: () {
            // Navigator.pop(context);
          },
          child: GestureDetector(
            onTap: widget.onTap,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: -2, // Negative value to contain the shadow within the border
                      blurRadius: 9,
                      offset: const Offset(0, 5),
                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  size: 18,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
        ):SizedBox(),
        Column(
          children: [
            SizedBox(
              height: 4,
            ),
            Center(
              child: Center(
                child: Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    fontFamily: "Abhaya"
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}