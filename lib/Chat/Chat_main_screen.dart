import 'package:flutter/material.dart';

import '../constants/constants.dart';
import '../widgets/AppBarHeader.dart';
import '../widgets/CachedImageView.dart';
import 'Chating_screen.dart';

class ChatMainScreen extends StatefulWidget {
  const ChatMainScreen({super.key});

  @override
  State<ChatMainScreen> createState() => _ChatMainScreenState();
}

class _ChatMainScreenState extends State<ChatMainScreen> {
  TextEditingController searchController = TextEditingController();


  List<String> category = [
    "All",
    "Unread",
    "Read"
  ];
  bool isOnline = true;
  int current = 0;
  Widget search_bar(){
    return TextFormField(
      cursorColor: K.primaryColor,
      controller: searchController,
      // onChanged: (value) {
      //   setState(() {
      //     searchResult = data
      //         .where((element) => element.toLowerCase().contains(value.toLowerCase()))
      //         .toList();
      //   });
      // },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey.shade50,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        hintText:  'Search',
        hintStyle: const TextStyle(fontFamily: 'Lato', fontSize: 15, fontWeight: FontWeight.w400, color: Colors.grey),
        contentPadding: const EdgeInsets.all(20),
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
                child: AppBarHeader("Chat", () {
                  Navigator.of(context).pop();
                },
                  isBack : false,
                ),
              ),
              const SizedBox(height: 3),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            InkWell(onTap:(){},child: Image.asset("assets/images/moreIcon.png", scale: 18, color: K.primaryColor,)),
                            const SizedBox(width: 10,),
                            Container(
                              height: 60,
                              width: MediaQuery.of(context).size.width/1.4,
                              child: search_bar(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height:15,),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          itemCount: category.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                setState(() {
                                  current = index;
                                });
                              },
                              child: AnimatedContainer(
                                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                width: 150,
                                height: 45,
                                decoration: BoxDecoration(
                                  color: current ==index? K.primaryColor: const Color(0x200EBE7F),
                                  borderRadius: current == index ? const BorderRadius.all(Radius.circular(10)):const BorderRadius.all(Radius.circular(5)),
                                ),
                                duration: const Duration(milliseconds: 200),
                                child: Center(
                                  child: Text("${category[index]}",style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'abhaya',
                                    color: current ==index? const Color(0xffFFFFFF) :Colors.black,
                                  ),),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 11,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              GestureDetector(
                                onTap:(){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ChattingScreen()));
                                },
                                child: ListTile(
                                  contentPadding: EdgeInsets.symmetric(vertical:7, horizontal: 20),
                                  leading: Stack(
                                    children: [
                                      CircleAvatar(
                                        radius: 22,
                                        backgroundColor: Colors.grey.shade300,
                                        child:  ClipRRect(
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
                                      Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                          width: 12, // Adjust the size of the status indicator as needed
                                          height: 12,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: isOnline ? Colors.green : Colors.grey,
                                            border: Border.all(color: Colors.white, width: 2),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  title:  Text("Aditya Mishra", style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      fontFamily: 'Lato'
                                  ),),
                                  subtitle:  Text("Recent received text will appear here.", style: TextStyle(
                                    overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15,
                                      fontFamily: 'Lato',
                                    color: K.primaryColor
                                  ),),
                                  trailing:  Column(
                                    children: [
                                      Text("3:28 PM", style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                          fontFamily: 'Lato'
                                      ),),
                                     SizedBox(height: 15,),
                                      isOnline?Container(
                                        width: 22, // Adjust the size of the status indicator as needed
                                        height: 22,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isOnline ? K.primaryColor : Colors.grey,
                                        ),
                                        child: Center(
                                          child: Text("2", style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10,
                                              fontFamily: 'Lato',
                                            color: Colors.white
                                          ),),
                                        ),
                                      ): SizedBox.shrink(),
                                    ],
                                  ),

                                ),
                              ),
                              Divider(height: 2, color: Colors.grey.shade200),
                            ],
                          );
                        },

                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
