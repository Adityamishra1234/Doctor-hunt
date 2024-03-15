import 'package:doctor_hunt/Community/addPost/addpost.dart';
import 'package:doctor_hunt/constants/constants.dart';
import 'package:doctor_hunt/widgets/progressIndicator/indicators.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../widgets/AppBarHeader.dart';
import '../widgets/CachedImageView.dart';
import 'package:readmore/readmore.dart';
import 'dart:math' as math;


class Community extends StatefulWidget {
  const Community({super.key});

  @override
  State<Community> createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool _isVisible = false;
  bool isLiked = false;
  // final GlobalKey<FabCircularMenuState> fabkey = GlobalKey();


  // Widget _buildButtonWithText(IconData icon, String text, BuildContext context) {
  //   return Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       RawMaterialButton(
  //         onPressed: (){
  //           showProgressDialog(context);
  //           // hideProgressDialog(context);
  //           print('pressed');
  //           Future.delayed(Duration(milliseconds: 800), (){
  //             Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Community()));
  //           });
  //           // hideProgressDialog(context);
  //         },
  //         shape: CircleBorder(),
  //         padding: EdgeInsets.all(24),
  //         child: CircleAvatar(
  //           backgroundColor: K.primaryColor,
  //             child: Icon(icon, color: Colors.white)),
  //       ),
  //       Positioned(
  //         bottom: -20, // Adjust this value to position the text
  //         child: Transform.translate(
  //           offset: Offset(0, -20),
  //           child: Text(
  //             text,
  //             style: TextStyle(color: Colors.black,fontFamily: "Lato", fontWeight: FontWeight.bold),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }


  @override
  void initState() {
    K.setBackgroundImage();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(right: 15.0,bottom: 15),
            child: CircularFabMenu(),
          );
        },

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      appBar: null,
      // backgroundColor:  Color(0xff0EBE7F),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(K.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: AppBarHeader("Community", () {
                  Navigator.of(context).pop();
                },
                  isBack : false,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 90,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          itemExtent: 85,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: K.primaryColor, // Set the border color
                                        width: 2, // Set the border width
                                      ),
                                      borderRadius: BorderRadius.circular(200), // Set border radius
                                    ),
                                    child: Stories(),
                                ),
                                Text("Aditya Mishra", style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10,
                                    fontFamily: 'Lato'
                                ),),



                              ],
                            );
                          },

                        ),
                      ),
                      SizedBox(height: 10,),
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 50,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.8),
                                    spreadRadius: -1,
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  )
                                ]
                            ),
                            child: Column(
                              children: [
                                Row(
                                  // crossAxisAlignment: CrossAxisAlignment.str,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: ListTile(
                                        // contentPadding: EdgeInsets.zero,
                                        leading: CircleAvatar(
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
                                        title: const Text("Aditya Mishra", style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Lato'
                                        ),),
                                        subtitle: const Text("22 Min Ago", style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Lato'
                                        ),),

                                      ),
                                    ),
                                    IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded),),
                                  ],
                                ),
                                SizedBox(height: 8,),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                                  child: Column(
                                    children: [
                                      ReadMoreText(
                                        trimLines: 3,
                                        "In the heart of bustling New York City, amidst the constant symphony of honking horns and hurried footsteps, "
                                            "there exists a figure whose presence seems to carve out a "
                                            "tranquil oasis within the chaos. Meet Alex Thompson, a "
                                            "enigmatic soul with an insatiable thirst for adventure and a heart brimming with compassion.W"
                                            "ith a shock of unruly curls that seem to dance in the wind and eyes as deep and mysterious as the ocean, Alex"
                                            " possesses an allure that draws people in like moths to a flame. Despite the cacophony of urban life, there's "
                                            "an unmistakable serenity that surrounds them, a calming presence that whispers tales of faraway lands and unto",
                                        style: TextStyle(
                                            fontSize: 12,
                                            height: 1.3,
                                            color: Colors.black,
                                            fontFamily: 'Lato'
                                        ),
                                        // colorClickableText: Colors.pink,
                                        trimMode: TrimMode.Line,
                                        trimCollapsedText:
                                        ' Read more',
                                        trimExpandedText:
                                        ' Show less',
                                        textAlign: TextAlign.start,
                                        moreStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color:  Color(0xff0EBE7F),
                                            fontFamily: 'Lato'
                                        ),
                                      ),
                                      SizedBox(height: 15,),
                                      SizedBox(
                                        height: 250,
                                        width: double.infinity,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5),
                                          child: CachedImageView(
                                            image: "https://img.freepik.com/free-photo/group-happy-diverse-volunteers_53876-166979.jpg?t=st=1710242952~exp=1710246552~hmac=5edb6dde6dae84a0c9402acb01a9effe12790306d20b240d39daf03f3a6cd855&w=1060",
                                            fit: BoxFit.cover,
                                            width: double.infinity,
                                            height: 220,
                                            errorHeight: 220,
                                            errorWidth: double.infinity,
                                            placeHolderHeight: 220,
                                            placeHolderWidth: double.infinity,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          Row(
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  setState(() {
                                                    isLiked = !isLiked;
                                                  });
                                              },
                                                  child: isLiked? Icon(Icons.favorite, color: Colors.red,size: 22,):Icon(Icons.favorite_outline_sharp, color: Colors.red,size: 22,)),
                                              SizedBox(width: 4,),
                                              const Text("3 Likes", style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Lato'
                                              ),),
                                            ],
                                          ),
                                          SizedBox(width: 10,),
                                          InkWell(
                                            onTap: (){
                                             showModalBottomSheet(
                                               isScrollControlled: true,
                                               shape: const RoundedRectangleBorder(
                                                 borderRadius:
                                                 BorderRadius
                                                     .vertical(
                                                   top: Radius
                                                       .circular(
                                                       5),
                                                 ),
                                               ),
                                               clipBehavior: Clip
                                                   .antiAliasWithSaveLayer,
                                               context: context, builder: (BuildContext context) {
                                                 return Container(
                                               padding: EdgeInsets.only(
                                                 top: MediaQuery.of(context).padding.top,
                                                 bottom: MediaQuery.of(context).viewInsets.bottom,
                                               ),
                                               decoration: const BoxDecoration(
                                                 color: Colors.white,
                                               ),
                                               child: DraggableScrollableSheet(
                                                 expand: false,
                                                 initialChildSize: 0.8,
                                                 minChildSize: 0.8,
                                                 maxChildSize: 1.0, //0.9,
                                                 snap: true,
                                                 builder: (BuildContext context, ScrollController scrollController) {
                                                   return CommentSheet();
                                                 },

                                               ),
                                             ); },
                                             );
                                            },
                                            child: Row(
                                              children: [
                                                Image.asset("assets/images/comment.png", scale: 20,),
                                                // Icon(Icons.mode_comment_outlined, color: Colors.grey,),
                                                SizedBox(width: 4,),
                                                const Text("3 Thoughts", style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w800,
                                                    fontFamily: 'Lato'
                                                ),),
                                              ],
                                            ),
                                          ),
                                          SizedBox(width: 10,),
                                          Row(
                                            children: [
                                              Image.asset("assets/images/share.png", scale: 22,),
                                              // Icon(Icons.share, color: Colors.black,size: 22,),
                                              SizedBox(width: 4,),
                                              const Text("1.1k", style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w800,
                                                  fontFamily: 'Lato'
                                              ),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

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

class CommentSheet extends StatefulWidget {
  @override
  State<CommentSheet> createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  TextEditingController searchController = TextEditingController();
  Icon suffixIcon = Icon(Icons.send);
  bool isLikedComment = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(K.backgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              child: AppBarHeader("Comments", () {
                Navigator.of(context).pop();
              },
                isBack : true,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.8),
                                  spreadRadius: -1,
                                  blurRadius: 8,
                                  offset: const Offset(0, 2),
                                )
                              ]
                          ),
                          child: Column(
                            children: [
                              Row(
                                // crossAxisAlignment: CrossAxisAlignment.str,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ListTile(
                                      // contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
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
                                      title: const Text("Aditya Mishra", style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Lato'
                                      ),),
                                      subtitle: const Text("22 Min Ago", style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: 'Lato'
                                      ),),

                                    ),
                                  ),
                                  IconButton(onPressed: () {}, icon: Icon(Icons.info_outlined,color: K.primaryBG2,),),
                                ],
                              ),
                              SizedBox(height: 8,),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0, right: 15, bottom: 10),
                                child: Column(
                                  children: [
                                    ReadMoreText(
                                      trimLines: 3,
                                      "In the heart of bustling New York City, amidst the constant symphony of honking horns and hurried footsteps, "
                                          "there exists a figure whose presence seems to carve out a "
                                          "tranquil oasis within the chaos. Meet Alex Thompson, a "
                                          "enigmatic soul with an insatiable thirst for adventure and a heart brimming with compassion.W"
                                          "ith a shock of unruly curls that seem to dance in the wind and eyes as deep and mysterious as the ocean, Alex"
                                          " possesses an allure that draws people in like moths to a flame. Despite the cacophony of urban life, there's "
                                          "an unmistakable serenity that surrounds them, a calming presence that whispers tales of faraway lands and unto",
                                      style: TextStyle(
                                          fontSize: 12,
                                          height: 1.3,
                                          color: Colors.black,
                                          fontFamily: 'Lato'
                                      ),
                                      // colorClickableText: Colors.pink,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText:
                                      ' Read more',
                                      trimExpandedText:
                                      ' Show less',
                                      textAlign: TextAlign.start,
                                      moreStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color:  Color(0xff0EBE7F),
                                          fontFamily: 'Lato'
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Row(
                                          children: [
                                            InkWell(
                                              onTap: (){
                                                setState(() {
                                                  isLikedComment = !isLikedComment;
                                                });
                                              },
                                                child: isLikedComment? Icon(Icons.favorite, color: K.primaryColor,size: 22,): Icon(Icons.favorite_outline_sharp, color: K.primaryColor,size: 22,)),
                                            SizedBox(width: 4,),
                                            const Text("3 Likes", style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'Lato'
                                            ),),
                                          ],
                                        ),
                                        SizedBox(width: 10,),
                                        Row(
                                          children: [
                                            InkWell(child: Icon(Icons.thumb_down_alt_outlined, color: Colors.red,size: 22,)),
                                            SizedBox(width: 4,),
                                            const Text("3 disikes", style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w800,
                                                fontFamily: 'Lato'
                                            ),),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                        );
                      },
                    ),
                    SizedBox(height: 50,),
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
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
                        child: CachedImageView(
                          image: "https://images.pexels.com/photos/20335828/pexels-photo-20335828/free-photo-of-young-doctor-wearing-a-hijab-and-a-stethoscope-posing-in-studio-and-smiling.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          fit: BoxFit.fill,
                          width: 36,
                          isErrorIcon: true,
                          height: 40,
                          errorHeight: 40,
                          errorWidth: 36,
                          placeHolderHeight: 40,
                          placeHolderWidth: 36,
                        ),
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
                          decoration:  InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment",

                            suffixIcon: (searchController.text.isNotEmpty)
                                ? IconButton(icon: const Icon(
                                Icons.send,
                                color: K.primaryColor,
                              ), onPressed: () {
                              searchController.clear();
                            }
                            ):null,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ]
    );
  }
}

class Stories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              const Color(0xffFFFFFF),
              const Color(0x800EBE7F),
              const Color(0x200EBE7F),
              const Color(0x800EBE7F),
              const Color(0xffFFFFFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          height: 42,
          width: 45,
          decoration: BoxDecoration(
              color: const Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(90),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 3,
                    spreadRadius: 1)
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: CachedImageView(
              image: "https://images.pexels.com/photos/20335828/pexels-photo-20335828/free-photo-of-young-doctor-wearing-a-hijab-and-a-stethoscope-posing-in-studio-and-smiling.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
              fit: BoxFit.fill,
              width: double.infinity,
              height: 220,
              errorHeight: 220,
              errorWidth: double.infinity,
              placeHolderHeight: 220,
              placeHolderWidth: double.infinity,
            ),
          ) ,
        ),
      ),
    );
  }

}



// this widgets is for custom fab animations

class CircularFabMenu extends StatefulWidget{
  @override
  State<CircularFabMenu> createState() => _CircularFabMenuState();
}

class _CircularFabMenuState extends State<CircularFabMenu> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _isMenuOpen = false;
  final double _fabHeight = 56.0;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
   // _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

  }
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleMenu(){
    // showDialog(context: context, builder: (context){
    //   return  CustomModal(content: AddPostStories(),);
    // });

    showModalBottomSheet(
      context: context, builder: (BuildContext context) {
      return Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: AddPostStories(),
      ); },
    );
    _animationController.dispose();

    
    setState(() {
      _isMenuOpen = !_isMenuOpen;

      if (_animationController.isDismissed) {
        _animationController.forward();
      } else {
        _animationController.reverse();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedFab(
        animation: _animation,
        onPressed: _toggleMenu,
      ),
        ..._buildMenuItems(),
      ]
    );
  }
  List<Widget> _buildMenuItems() {
    final double centerX = MediaQuery.of(context).size.width / 2;
    final double centerY = MediaQuery.of(context).size.height / 2;
    double radius = 100;

    List<Widget> menuItems = [];

    for (int i = 0; i < 5; i++) {
      double angle = 2 * math.pi / 5 * i;
      //double radius = 150.0; // Adjust the radius to control the distance from the FAB icon
      double x = centerX + radius * math.cos(angle);
      double y = centerY + radius * math.sin(angle);
      print("Menu item $i - X: $x, Y: $y");

      menuItems.add(
        Positioned(
          left: x, // Adjust the left position to center the menu item
          top: y , // Adjust the top position to center the menu item
          child: IconButton(
            icon: Icon(Icons.close, color: Colors.black),
            onPressed: () {
              // Add your action here
            },
          ),
        ),
      );
    }

    return menuItems;
  }











}

class AnimatedFab extends StatelessWidget {
  final Animation<double> animation;
  final VoidCallback onPressed;

  AnimatedFab({required this.animation, required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: animation,
        builder: (context, child){
          return Transform.rotate(
              angle: animation.value*2.34,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: FloatingActionButton(
                backgroundColor:  Color(0xff0EBE7F),
                onPressed: onPressed,
                tooltip: "Toggle menu",
                child: Icon(Icons.add, color: CupertinoColors.white,),
              ),
            ),
          );

        }
    );
  }


}








//modal



class CustomModal extends StatelessWidget {
  final Widget content;

  const CustomModal({Key? key, required this.content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigator.pop(context); // Close the modal if tapped outside the content
      },
      child: Material(
        color: Colors.transparent,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                  spreadRadius: 2.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: content,
          ),
        ),
      ),
    );
  }
}


class AddPostButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return CustomModal(
              content: AddPostStories(),
            );
          },
        );
      },
      shape: CircleBorder(),
      padding: EdgeInsets.all(24),
      child: CircleAvatar(
        backgroundColor: Colors.blue, // Change this to your desired color
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class AddPostStories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/bgabovecommon.png",),
          fit: BoxFit.fill
        ),
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: -1,
              blurRadius: 8,
              offset: const Offset(0, 2),
            )
          ]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(width: 10,),
              Column(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: K.primaryColor,
                    child: Icon(Icons.history, color: Colors.white,),
                  ),
                  SizedBox(height: 5,),
                  const Text("Add Story", style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato'
                  ),),

                ],
              ),
              SizedBox(width: 20,),
              Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AddPost()));
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: K.primaryColor,
                      child: Icon(Icons.add, color: Colors.white,),
                    ),
                  ),
                  SizedBox(height: 5,),
                  const Text("Add Post", style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato'
                  ),),

                ],
              ),
              SizedBox(width: 10,),
            ],
          ),
        ],
      ),
    );
  }
}








