import 'package:doctor_hunt/widgets/customButton.dart';
import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../widgets/AppBarHeader.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  void initState() {
    K.randomImages[0];
    super.initState();
  }

  Widget search_bar() {
    var searchController = TextEditingController();
    return TextFormField(
      cursorColor: K.primaryColor,
      controller: searchController,
      maxLines: null,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.transparent,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        hintText: 'Write a caption',
        hintStyle: const TextStyle(
          fontFamily: '',
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.grey,
        ),
        contentPadding: const EdgeInsets.all(10),
        prefixIcon: const Icon(Icons.add, color: Colors.grey),
      ),
    );
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: null,
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(K.randomImages[0]),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                child: AppBarHeader(
                  "Add Post",
                  color: Colors.white,
                      () {
                    Navigator.of(context).pop();
                  },
                  isBack: true,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.grey.shade500,
                        height: 300,
                        width: double.infinity,
                      ),
                      const SizedBox(height: 0),
                      search_bar(),
                      Divider(height: 30, color: Colors.grey.shade700),
                      SizedBox( // Add SizedBox with defined height
                        height: MediaQuery.of(context).size.height - 500, // Adjust height as needed
                        child: SingleChildScrollView( // Wrap with SingleChildScrollView
                          child: Column(
                            children: [
                              ListTile(
                                leading: Icon(Icons.location_on, color: Colors.white),
                                title: const Text(
                                  "Add Location",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                              ),
                              ListTile(
                                leading: Icon(Icons.location_on, color: Colors.white),
                                title: const Text(
                                  "Add Location",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                              ),
                              ListTile(
                                leading: Icon(Icons.person, color: Colors.white),
                                title: const Text(
                                  "Tag People / Doctors",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: 'Lato',
                                  ),
                                ),
                                trailing: Icon(Icons.arrow_forward_ios, color: Colors.white),
                              ),
                            ],
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
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15.0),
        child: LoginButton(
          title: "Share",
          onTap: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

}
