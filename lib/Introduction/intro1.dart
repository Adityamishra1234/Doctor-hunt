// import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/Introduction/model/content_model.dart';
import 'package:doctor_hunt/auth/signup.dart';
import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
// import 'package:doctor_hunt/widgets/bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/customButton.dart';
import '../widgets/navigation_drawer.dart';




class Introduction extends StatefulWidget {
  static const route = "/Introduction";
  const Introduction({Key? key}) : super(key: key);

  @override
  State<Introduction> createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  int currentIndex = 0;
  late PageController _controller;
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    double screenheight = mediaQuery.size.height;
    double screenwidth = mediaQuery.size.width;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgcommon.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              height: screenheight / 1.9,
              child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 60, bottom: 30),
                    //height: screenheight / 2,
                    child: Image.asset(
                      contents[i].image,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),


            //dots in page view
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
               contents.length,
                    (index) => buildDot(index, context),
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20, left: 30, right: 30,),
              child: Text(
                textAlign: TextAlign.center,
                contents[currentIndex].discription,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Abhaya',
                  color: Color(0xff414040),
                ),
              ),
            ),
            // const Spacer(),
            const SizedBox(height: 10,),

            Container(
              margin: EdgeInsets.only(top: 5, left: 30, right: 30, bottom: 10),
              child: Text(
                textAlign: TextAlign.center,
                contents[currentIndex].discription1,
                maxLines: 10,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: Color(0xff414040),
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                right: 50,
                left: 50,
              ),
              child: LoginButton(
                title: "Get Started",
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Register()));
                  // if (currentIndex == contents.length - 1) {
                  // Navigator.pushNamed(context, HomeBar.route);
                  // }
                  // _controller.nextPage(
                  //   duration: const Duration(milliseconds: 100),
                  //   curve: Curves.bounceIn,
                  // );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 20,
                left: 10,
                right: 10,
              ),
              width: double.infinity,
              child:  GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                },
                child: const Center(
                    child: Text("Skip",
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                            decorationColor: Color(0xff0EBE7F),
                            color: Color(0xff0EBE7F),
                            fontWeight: FontWeight.w500,
                            fontSize: 16.45))),
              ),
            ),
            const Spacer(),
            Container(
                margin: const EdgeInsets.only(top: 35, left: 30, right: 30),
                child: const Column(
                  children: [
                    Text(
                        "By Signing up you agree to the Terms and Condition of DOCTOR HUNT",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xff808080),
                            fontWeight: FontWeight.w600,
                            height: 1.5,
                            fontSize: 13,
                            fontFamily: 'Lato')),
                  ],
                )),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    bool visited = currentIndex == index;
    return Container(
      height: 10,
      width: 10, //currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: visited ? const Color(0xff0EBE7F) : const Color(0xffD1D1D6),
      ),
    );
  }
}




// import '../widgets/customButton.dart';
//
//
// class Onboarding extends StatefulWidget {
//   // static const route = "/Onboarding";
//   @override
//   _OnboardingState createState() => _OnboardingState();
// }
//
// class _OnboardingState extends State<Onboarding> {
//   int currentIndex = 0;
//   late PageController _controller;
//
//   @override
//   void initState() {
//     _controller = PageController(initialPage: 0);
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData mediaQuery = MediaQuery.of(context);
//     double screenheight = mediaQuery.size.height;
//     double screenwidth = mediaQuery.size.width;
//     return Scaffold(
//       body: Stack(
//         children: [
//           Align(
//             alignment: Alignment.topLeft,
//             child: Image.asset("assets/images/greencircle.png",scale: 1,),
//           ),
//           Column(
//           children: [
//             SizedBox(
//               height: screenheight / 1.9,
//               child: PageView.builder(
//                 controller: _controller,
//                 itemCount: contents.length,
//                 onPageChanged: (int index) {
//                   setState(() {
//                     currentIndex = index;
//                   });
//                 },
//                 itemBuilder: (_, i) {
//                   return Container(
//                     margin: EdgeInsets.only(top: 80, bottom: 50),
//                     //height: screenheight / 2,
//                     child: Image.asset(
//                       contents[i].image,
//                       fit: BoxFit.contain,
//                     ),
//                   );
//                 },
//               ),
//             ),
//             //dots in page view
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 contents.length,
//                     (index) => buildDot(index, context),
//               ),
//             ),
//             // const Spacer(),
//             Container(
//               margin: EdgeInsets.only(top: 20, left: 20, right: 20,),
//               child: Text(
//                 textAlign: TextAlign.center,
//                 contents[currentIndex].discription,
//                 maxLines: 2,
//                 style: const TextStyle(
//                   fontSize: 35,
//                   fontWeight: FontWeight.w500,
//                   color: Color(0xff414040),
//                 ),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(top: 20, left: 30, right: 30, bottom: 30),
//               child: Text(
//                 textAlign: TextAlign.center,
//                 contents[currentIndex].discription1,
//                 maxLines: 3,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.w300,
//                   color: Color(0xff414040),
//                 ),
//               ),
//             ),
//             const Spacer(),
//             // Padding(
//             //   padding: EdgeInsets.only(
//             //     right: 40,
//             //     left: 40,
//             //   ),
//             //   child: LoginButton(title: "Get Started",
//             //   onTap: (){
//             //     Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
//             //   }
//             //   ),
//             // ),
//            Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=> MyHomePage()));
//                 },
//                 child: const Text("Skip",
//                     style: TextStyle(
//                         color:  Colors.grey,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16.45)),
//               ),
//             ),
//             const Spacer(),
//           ],
//         ),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Image.asset("assets/images/bgcommon.png",scale: 1,),
//           ),
//
//         ],
//       ),
//     );
//   }
//
//   Container buildDot(int index, BuildContext context) {
//     bool visited = currentIndex == index;
//     return Container(
//       height: 12,
//       width: 12, //currentIndex == index ? 25 : 10,
//       margin: const EdgeInsets.only(right: 12),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: visited ? const  Color(0xff0EBE7F) : Color(0xffD1D1D6),
//       ),
//     );
//   }
// }