import 'package:doctor_hunt/Privacy_policy.dart';
import 'package:doctor_hunt/auth/login.dart';
import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../Firebase_Backend/auth/google_sign_in.dart';
import '../Firebase_Backend/auth/userProvider.dart';
import '../widgets/bottom_navigation_bar.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  late FocusNode _namefocusNode = FocusNode();
  late FocusNode _emailfocusNode = FocusNode();
  late FocusNode _passwordfocusNode = FocusNode();
  late OutlineInputBorder _namefocusNodeBorder;
  late OutlineInputBorder _emailfocusNodeBorder;
  late OutlineInputBorder _passwordfocusNodeBorder;

  Color lock = Colors.black45;
  Color email1 = Colors.black45;
  Color name1 = Colors.black45;

  String selected = "";
  bool isSigningUp = false;

  @override
  void initState() {
    _namefocusNode = FocusNode();
    _emailfocusNode = FocusNode();
    _passwordfocusNode = FocusNode();
    _namefocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _emailfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    _passwordfocusNodeBorder = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.grey,
      ),
      borderRadius: BorderRadius.circular(8.0),
    );
    super.initState();
  }

  //Creating new user in firebase always
  Future<void> createAccount() async {
    setState(() {
      isSigningUp = true;
    });
    String Name = name.text.trim();
    String Email = email.text.trim();
    String Password = password.text.trim();
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: Email,
        password: Password,
      );
     // await CircularProgressIndicator(color: Color(0xff0EBE7F),);
      await Fluttertoast.showToast(
        msg: "Registration Successful, Please login now",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0,
      );
      // ignore: use_build_context_synchronously
          Future.delayed(Duration(milliseconds: 30), () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(name: Name)));
      });
    } catch (error) {
      print(error);
      await Fluttertoast.showToast(
        msg: "Registration Failed",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black45,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    } finally {
      setState(() {
        isSigningUp = false;
      });
    }
  }
  @override
  void dispose(){
    _namefocusNode.dispose();
    _emailfocusNode.dispose();
    _passwordfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final userProvider = Provider.of<UserProvider>(context);
    // final user = userProvider.userName;
    return Scaffold(
      appBar: null,
      body:Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bgcommon.png"),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: SafeArea(
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      child: Column(
                        children: [
                          const SizedBox(height: 60,),
                          const Text("Join us to start searching",
                            maxLines: 3,
                            style:  TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff414040),
                            ),
                          ),
                          const Text("You can search course, apply course and find scholarship for abroad studies",
                            textAlign:TextAlign.center,
                            maxLines: 5,
                            style:  TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey,
                            ),
                          ),
                          // const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(top: 58.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    try{
                                      await signInWithGoogle(context);
                                      // if(user != null){
                                      //   Future.delayed(Duration(milliseconds: 3000) ,() {
                                      //     Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(name: user.displayName,)));
                                      //   });
                                      // }
                                      // else {
                                      //   print("user name is coming ${user?.displayName}");
                                      // }

                                    }
                                    catch(e){
                                      print("No sign in with google because of $e");
                                    }
                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: -1.2, // Negative value to contain the shadow within the border
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        )],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 18.0, bottom: 18,right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/images/google.png"),
                                          const SizedBox(width: 10,),
                                          const Text("Google",
                                            textAlign:TextAlign.center,
                                            maxLines: 3,
                                            style:  TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w300,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){

                                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>InsideArticles()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: CupertinoColors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: -1.1, // Negative value to contain the shadow within the border
                                          blurRadius: 5,
                                          offset: const Offset(0, 2),
                                        )],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 18.0, bottom: 18, right: 25, left: 25),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Image.asset("assets/images/facebook.png", scale: 4,),
                                          const SizedBox(width: 8,),
                                          const Text("Facebook",
                                            textAlign:TextAlign.center,
                                            maxLines: 3,
                                            style:  TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),


                          //text fields
                          Padding(
                            padding: const EdgeInsets.only(top: 80.0, right: 15,left: 15),
                            child: SizedBox(
                                width:double.infinity,
                                child: Focus(
                                  onFocusChange: (bool hasFocus){
                                    setState(() {
                                      name1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                                      _namefocusNodeBorder = hasFocus
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
                                    focusNode: _namefocusNode,
                              controller: name,
                              cursorColor: const Color(0xff0EBE7F),
                              decoration: InputDecoration(
                                    prefixIcon:  Icon(Icons.person,color: name1),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: _namefocusNodeBorder,
                                    focusedBorder: _namefocusNodeBorder,
                                    hintText: "Enter Your Name",
                              ),
                            ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15),
                            child: SizedBox(
                                width:double.infinity,
                                child: Focus(
                                  onFocusChange: (bool hasFocus){
                                    setState(() {
                                      email1 = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                                      _emailfocusNodeBorder = hasFocus
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
                                    focusNode: _emailfocusNode,
                                    controller: email,
                                    cursorColor: const Color(0xff0EBE7F),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email,color: email1),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: _emailfocusNodeBorder,
                                      focusedBorder: _emailfocusNodeBorder,
                                      hintText: "Enter Your email",
                                    ),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, right: 15,left: 15, bottom: 8),
                            child: SizedBox(
                                width:double.infinity,
                                child: Focus(
                                  onFocusChange: (bool hasFocus){
                                    setState(() {
                                      lock = hasFocus?const Color(0xff0EBE7F):Colors.black45;
                                      _passwordfocusNodeBorder = hasFocus
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
                                    focusNode: _passwordfocusNode,
                                    controller: password,
                                    obscureText: true,
                                    cursorColor: const Color(0xff0EBE7F),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.lock_person, color: lock),
                                      filled: true,
                                      fillColor: Colors.white,
                                      enabledBorder: _passwordfocusNodeBorder,
                                      focusedBorder: _passwordfocusNodeBorder,
                                      hintText: "Enter Your Password",
                                    ),
                                  ),
                                )),
                          ),

                          //radiobutton
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0, left: 5),
                            child: Row(
                              children: [
                               Radio(splashRadius: 1,activeColor: const  Color(0xff0EBE7F),value: "Check1", groupValue: selected, onChanged: (value){
                                 setState(() {
                                   selected = value.toString();
                                 });
                               }),
                                Expanded(
                                  child: RichText(
                                    text:TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: "I agree with the ",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey,)
                                        ),
                                        TextSpan(
                                            text: "Terms of service",
                                            style: TextStyle(
                                                decoration: TextDecoration.underline,
                                                decorationColor: Color(0xff0EBE7F),
                                                decorationStyle: TextDecorationStyle.solid,
                                                decorationThickness: 3,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff0EBE7F))
                                        ),
                                        TextSpan(
                                            text: " and ",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,)
                                        ),
                                        TextSpan(
                                          text: " Privacy Policy ",
                                          style: TextStyle(
                                            decoration: TextDecoration.underline,
                                            decorationColor: Color(0xff0EBE7F),
                                            decorationThickness: 3,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff0EBE7F)),
                                          recognizer: TapGestureRecognizer()..onTap = (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const PrivacyPolicy()));
                                        }
                                        ),

                                      ],
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,)
                                    )
                                  ),
                                ),
                              ],
                            ),
                          ),

                          //buttons
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 40,
                              right: 50,
                              left: 50,
                            ),
                            child: LoginButton(title: "Sign Up",
                                onTap: (){
                                  createAccount();

                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
                                }
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(
                              top: 30,
                              left: 10,
                              right: 10,
                            ),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Have an Account?",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16.45)),
                                const SizedBox(width: 5,),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => const Login()));
                                  },
                                  child: Text("LOGIN",
                                      style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          decorationColor:Colors.greenAccent,
                                          color: Color(0xff0EBE7F),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.45)),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: Alignment.topLeft,
          //   child: Image.asset("assets/images/bgabovecommon.png",),
          // ),
        ],
      ),
    );
  }}
