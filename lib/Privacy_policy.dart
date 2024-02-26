import 'package:doctor_hunt/widgets/AppBarHeader.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
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
                child: AppBarHeader("Privacy policy", () {
                  Navigator.of(context).pop();
                }),
              ),
              const SizedBox(height: 3),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/bgcommon.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        Text("Doctor Hunt APPs Privacy Policy",
                          style: TextStyle(
                            fontSize: 20,
                          fontWeight: FontWeight.bold, color: Colors.black54,
                        ),
                        ),
                        SizedBox(height: 20,),
                        Text("There are many variations of passages of Lorem Ipsum "
                            "available, but the majority have suffered alteration in some form,"
                            " by injected humour, or randomised words believable."
                            " It is a long established fact that reader will distracted by "
                            "the readable content of a page when looking at its layout. "
                            "The point of using Lorem Ipsum is that it has a moreIt is a long "
                            "established fact that reader will distracted by the readable content "
                            "of a page when looking at its layout."
                            " The point of using Lorem Ipsum is that it has a more ",
                          style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.w300, color: Colors.grey[500],
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text("There are many variations of passages of Lorem Ipsum "
                            "available, but the majority have suffered alteration in some form,"
                            " by injected humour, or randomised words believable."
                            " It is a long established fact that reader will distracted by "
                            "the readable content of a page when looking at its layout. "
                            "The point of using Lorem Ipsum is that it has a moreIt is a long "
                            "established fact that reader will distracted by the readable content "
                            "of a page when looking at its layout."
                            " The point of using Lorem Ipsum is that it has a more ",
                          style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.w300, color: Colors.grey[500],
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text("There are many variations of passages of Lorem Ipsum "
                            "available, but the majority have suffered alteration in some form,"
                            " by injected humour, or randomised words believable."
                            " It is a long established fact that reader will distracted by "
                            "the readable content of a page when looking at its layout. "
                            "The point of using Lorem Ipsum is that it has a moreIt is a long "
                            "established fact that reader will distracted by the readable content "
                            "of a page when looking at its layout."
                            " The point of using Lorem Ipsum is that it has a more ",
                          style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.w300, color: Colors.grey[500],
                        ),
                        ),
                        SizedBox(height: 15,),
                        Text("There are many variations of passages of Lorem Ipsum "
                            "available, but the majority have suffered alteration in some form,"
                            " by injected humour, or randomised words believable."
                            " It is a long established fact that reader will distracted by "
                            "the readable content of a page when looking at its layout. "
                            "The point of using Lorem Ipsum is that it has a moreIt is a long "
                            "established fact that reader will distracted by the readable content "
                            "of a page when looking at its layout."
                            " The point of using Lorem Ipsum is that it has a more ",
                          style: TextStyle(
                            fontSize: 16,
                          fontWeight: FontWeight.w300, color: Colors.grey[500],
                        ),
                        ),
                        SizedBox(height: 15,),

                      ],
                    ),
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
