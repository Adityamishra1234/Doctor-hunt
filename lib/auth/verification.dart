import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../widgets/bottom_navigation_bar.dart';

class verification extends StatefulWidget {
  final String verificationId;
  const verification({super.key, required this.verificationId});
  @override
  State<verification> createState() => _verificationState();
}

class _verificationState extends State<verification> {

  TextEditingController email = TextEditingController();
  late FocusNode _emailfocusNode = FocusNode();
  late OutlineInputBorder _emailfocusNodeBorder;
  Color email1 = Colors.black45;
  bool loading = false;

  TextEditingController otpController = TextEditingController();

  @override
  void initState() {
    _emailfocusNode = FocusNode();
    _emailfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }
  @override
  void dispose(){
    _emailfocusNode.dispose();
    super.dispose();
  }

  void verifyOtp()async{
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId, smsCode: otpController.text.trim());
    try{
      UserCredential userCredential =  await FirebaseAuth.instance.signInWithCredential(credential);
      if(userCredential!=null){
        setState(() {
          loading = true;
        });
        Future.delayed(Duration(milliseconds: 3000) ,() {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
        });
        Navigator.popUntil(context, (route) => route.isCurrent);
      }

      else{
        setState(() {
          loading = false;
        });
      }
    }
    catch(e){
      print("Not going to next screen");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Image.asset("assets/images/rectangle.png", scale: 5,),
              Expanded(
                child: SingleChildScrollView(
                  child: Stack(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: SafeArea(
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 60,),
                                    const Text("Enter 6 Digits Code",
                                      maxLines: 3,
                                      style:  TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff414040),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Enter the 6 digits code that you received on your Phone.",
                                      maxLines: 5,
                                      style:  TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const SizedBox(height: 35,),
                                    // const Spacer(),
                                    //text fields
                                    SizedBox(
                                        width:double.infinity,
                                        child:  Center(
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Padding(
                                              padding: const EdgeInsets.all(2.0),
                                              child: PinCodeTextField(
                                                keyboardType: TextInputType.number,
                                                controller: otpController,
                                                appContext: context,
                                                length: 6,
                                                onChanged: (value) {},
                                                onCompleted: (value) {
                                                  // verifyOtp();
                                                },
                                                pinTheme: PinTheme(
                                                    shape: PinCodeFieldShape.box,
                                                    borderRadius: BorderRadius.circular(15.0),
                                                    selectedFillColor:  Colors.grey[200],
                                                    inactiveFillColor: Colors.grey[200],
                                                    inactiveColor: Colors.grey[400],
                                                    selectedColor: Colors.grey,
                                                    fieldWidth: 60,
                                                    fieldHeight: 60),
                                                // textStyle: const TextStyle(
                                                //   color: Color(0xff0EBE7F),
                                                // ),
                                              ),
                                            ),
                                          ),
                                        ),
                                    ),

                                    //buttons
                                      Padding(
                                      padding: const EdgeInsets.only(
                                        top: 40,
                                      ),
                                      child: LoginButton(title: "Continue",
                                        onTap: (){
                                        verifyOtp();
                                        },

                                          loading:loading
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }}
