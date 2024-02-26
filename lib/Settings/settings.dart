import 'package:doctor_hunt/Settings/Setting_model/setting_model.dart';
import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool isSwitched = true;
  bool isSwitched1 = true;
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
                child: AppBarHeader("Settings", () {
                  Navigator.of(context).pop();
                }),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Text("Account Settings" ,style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                          fontSize: 20,
                        ),),
                      ),
                      SizedBox(
                        height: 320,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: accountSettings.length,
                            itemBuilder: (context, index){
                              return ListTile(
                                minVerticalPadding: 20,
                                selected: false,
                                leading:  CircleAvatar(
                                  radius: 20,
                                  backgroundColor:accountSettings[index].bgcolor,
                                  child: accountSettings[index].image,
                                ),
                                title:  Text("${accountSettings[index].discription}", style: TextStyle(
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.w300,
                                    fontSize: 20
                                ),),
                                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20,),
                              );
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0,left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("More Options" ,style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 18,
                            ),),
                            const SizedBox(height: 25,),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0,left: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                     Text("Text Messages" ,style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),),
                                      CupertinoSwitch(
                                          value: isSwitched,
                                          onChanged: (bool value){
                                            setState(() {
                                              isSwitched = value;
                                            });
                                      })
                                    ],
                                  ),
                                  const SizedBox(height: 20,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                       Text("Phone calls" ,style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                         color: Colors.grey[600],
                                        fontSize: 16,
                                      ),),
                                      CupertinoSwitch(
                                          value: isSwitched1,
                                          onChanged: (bool value){
                                            setState(() {
                                              isSwitched1 = value;
                                            });
                                      })
                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Languages" ,style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),),
                                      Row(
                                        children: [
                                          Text("English " ,style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black45,
                                            fontSize: 15,
                                          ),),
                                          Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20),
                                        ],
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                 Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Currency" ,style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),),
                                      Row(
                                        children: [
                                          Text("₹ - INR " ,style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black45,
                                            fontSize: 15,
                                          ),),
                                          Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20),
                                        ],
                                      ),

                                    ],
                                  ),
                                  const SizedBox(height: 30,),
                                   Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Linked accounts" ,style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                      ),),
                                      const Row(
                                        children: [
                                          Text("Google " ,style: TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black45,
                                            fontSize: 15,
                                          ),),
                                          Icon(Icons.arrow_forward_ios, color: Colors.grey,size: 20),
                                        ],
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
