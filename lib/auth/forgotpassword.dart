import 'package:doctor_hunt/auth/verification.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class forgotpassword extends StatefulWidget {
  const forgotpassword({super.key});
  @override
  State<forgotpassword> createState() => _forgotpasswordState();
}

class _forgotpasswordState extends State<forgotpassword> {
  bool showVerificationPage = false;
  late String verificationId;

  TextEditingController otp = TextEditingController();
  late FocusNode _otpfocusNode = FocusNode();
  late OutlineInputBorder _otpfocusNodeBorder;
  Color otp1 = Colors.black45;
  bool loading = false;

void sendOtp(){
  String phone = "+91" + otp.text.trim();
  FirebaseAuth.instance.verifyPhoneNumber(
    phoneNumber: phone,
      verificationCompleted: (verificationId){
      },
      verificationFailed: (ex){
      },
      codeSent: (verificationId, resendToken){
      setState(() {
        showVerificationPage =true;
        this.verificationId = verificationId;
        loading = true;
      });
      },
      codeAutoRetrievalTimeout:(verificationId){

      },
    timeout: Duration(seconds: 30),
  );
}


  @override
  void initState() {
    _otpfocusNode = FocusNode();
    _otpfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }
  @override
  void dispose(){
    _otpfocusNode.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: null,
      body: showVerificationPage? verification(verificationId: verificationId)
          : Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgcommon.png"),
            fit: BoxFit.fill,
          ),
        ),
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
                                    const Text("Forgot Password",
                                      maxLines: 3,
                                      style:  TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff414040),
                                      ),
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text("Enter your Phone number for the verification process\nWe will send 6 digit code.",
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
                                        child: Focus(
                                          onFocusChange: (bool hasFocus){
                                            setState(() {
                                              otp1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                                              _otpfocusNodeBorder = hasFocus
                                                  ? OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xff0EBE7F),
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              )
                                                  : OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius: BorderRadius.circular(8.0),
                                              );
                                            });
                                          },
                                          child: TextField(
                                            focusNode: _otpfocusNode,
                                            maxLength: 10,
                                            controller: otp,
                                            cursorColor: const Color(0xff0EBE7F),
                                            keyboardType: TextInputType.number,
                                            decoration: InputDecoration(
                                              counterText: "",
                                              prefixIcon: Icon(Icons.phone,color: otp1),
                                              filled: true,
                                              fillColor: Colors.white,
                                              enabledBorder: _otpfocusNodeBorder,
                                              focusedBorder: _otpfocusNodeBorder,
                                              hintText: "Enter Your Number",
                                            ),
                                          ),
                                        )),


                                    //buttons
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        top: 40,
                                      ),
                                      child: GestureDetector(
                                        onTap: (){
                                          setState(() {
                                            // showVerificationPage = true;
                                          });
                                          // Navigator.push(context, MaterialPageRoute(builder: (context)=>const verification()));

                                        },
                                        child: LoginButton(title: "Continue",
                                          onTap: (){
                                            sendOtp();
                                          },
                                          loading : loading
                                        ),
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
