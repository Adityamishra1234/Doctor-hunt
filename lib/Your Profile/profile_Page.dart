// import 'dart:io';
//
// // import 'package:doctor_hunt/UIhelper.dart';
// import 'package:doctor_hunt/widgets/AppBarHeader.dart';
// import 'package:doctor_hunt/widgets/UiHelperTextField.dart';
// import 'package:doctor_hunt/widgets/customButton.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// import '../widgets/CachedImageView.dart';
//
// class ProfilePage extends StatefulWidget{
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Container(
//             height: 150,
//             width: 300,
//             decoration: BoxDecoration(
//               color: CupertinoColors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: -0.2,
//                   blurRadius: 2,
//                   offset: const Offset(0, 2),
//                 )],
//             ),
//           ),
//             Align(
//               alignment: Alignment.topCenter,
//               child: Container(
//                 width: 60,
//                 height: 60,
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(60),
//                   child: CachedImageView(
//                     image: "",
//                     fit: BoxFit.fill,
//                     width: double.infinity,
//                     height: 220,
//                     errorHeight: 220,
//                     errorWidth: double.infinity,
//                     placeHolderHeight: 220,
//                     placeHolderWidth: double.infinity,
//                   ),),
//               ),
//             )
//           ]
//         ),
//       ),
//     );
//   }
//  }