import 'package:flutter/material.dart';

class UiHelper {
  static CustomTextField(TextEditingController controller, String labell, String text , IconData iconData , ){
    return
      Container(
        width: 330,

        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              label: Text(labell ),
              labelStyle: TextStyle(color: Color(0xff0EBE7F)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      width: 2,
                      color: Colors.white
                  )
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                    color: Color(0xff0EBE7F),
                  )
              ),
              hintText: text,
              suffixIcon: Icon(iconData),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
        ),
      );

  }
  static CustomButton(VoidCallback voidCallback , String text){
    return SizedBox(
      height: 50,
      width: 280,
      child: ElevatedButton(onPressed: (){
        voidCallback();
      }, child: Text(text , style: TextStyle(color: Colors.white , fontSize: 20),),
        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          backgroundColor:  Color(0xff0EBE7F),

        ),

      ),
    );
  }
}