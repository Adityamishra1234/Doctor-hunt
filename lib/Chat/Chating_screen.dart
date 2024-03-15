import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../constants/constants.dart';
import '../widgets/AppBarHeader.dart';
import '../widgets/CachedImageView.dart';

class ChattingScreen extends StatefulWidget {
  const ChattingScreen({super.key});

  @override
  State<ChattingScreen> createState() => _ChattingScreenState();
}

class _ChattingScreenState extends State<ChattingScreen> {
  TextEditingController searchController = TextEditingController();
  Icon suffixIcon = Icon(Icons.send);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xff0EBE7F), // Set your desired color
      ),
    );
    return Scaffold(
      appBar: null,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bgabovecommon.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
              children: [
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: double.infinity,
                        height:100,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                          ),
                          color: K.primaryColor,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 15, left: 12,),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  InkWell(
                                    onTap: ()=> Navigator.of(context).pop(),
                                      child: Icon(Icons.arrow_back, color: Colors.white)),
                                  const SizedBox(width: 10), // Add some space between the icon and ListTile
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey.shade300,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedImageView(
                                        image: "https://lh3.googleusercontent.com/a/ACg8ocINQEpdO1qVf8mw-owPaF5tRGX1jAHdMA6DcPBMz6Enmg=s96-c",
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                        height: 220,
                                        errorHeight: 220,
                                        errorWidth: double.infinity,
                                        placeHolderHeight: 220,
                                        placeHolderWidth: double.infinity,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12), // Add some space between the avatar and text
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Aditya Mishra",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        "Online",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          fontFamily: 'Lato',
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                      child: Icon(Icons.add_ic_call,color: Colors.white,size: 20,),
                                    backgroundColor: Colors.black.withAlpha(20),
                                    radius: 20,
                                  ),
                                  SizedBox(width: 12,),
                                  CircleAvatar(
                                    child: Icon(Icons.menu,color: Colors.white,size: 20,),
                                    backgroundColor: Colors.black.withAlpha(20),
                                    radius: 20,
                                  ),
                                ],
                              ),


                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),

                  ],
                ),
              ],
            ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 3,
                        spreadRadius: 1,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(80),
                              child: Icon(Icons.emoji_emotions, color: Colors.black,),
                            ),
                            const SizedBox(width: 15),
                            InkWell(
                              onTap: (){
                              },
                              child: Icon(PhosphorIcons.link(PhosphorIconsStyle.regular)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: TextFormField(
                                controller: searchController,
                                onChanged: (value){
                                  setState(() {
                                    suffixIcon = Icon(
                                      Icons.send,
                                      color: K.primaryColor,
                                    );
                                  });
                                },
                                cursorColor: K.primaryColor,
                                style: TextStyle(color: Colors.black),
                                decoration:  InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Message",

                                  suffixIcon: (searchController.text.isNotEmpty)
                                      ? GestureDetector(
                                    onTap: () {
                                      searchController.clear();
                                    },
                                    child: Icon(
                                      Icons.send,
                                      color: K.primaryColor,
                                    ),
                                  )
                                      : null,

                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                CircleAvatar(
                                  child: Icon(Icons.mic,color: Colors.white,size: 20,),
                                  backgroundColor: K.primaryColor,
                                  radius: 20,
                                ),
                                SizedBox(width: 12,),
                                CircleAvatar(
                                  child: Icon(Icons.camera_alt_outlined,color: Colors.white,size: 20,),
                                  backgroundColor: K.primaryColor,
                                  radius: 20,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}

