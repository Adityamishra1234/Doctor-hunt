import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String? title;
  final double? size;
  final bool? loading;
  final VoidCallback? onTap;
  const LoginButton({Key? key,this.title,this.onTap,this.size=20,  this.loading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color:const  Color(0xff0EBE7F),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextButton(
            onPressed: (){
              if (loading == null || !loading!) {
              onTap!();
            }},
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
            child: loading != null && loading! ? CircularProgressIndicator(color: Colors.white,):Text("$title", style:  TextStyle(
                color: Colors.white,
                fontSize: size,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5
            ),),
          ),
        ),
      ),
    );
  }
}