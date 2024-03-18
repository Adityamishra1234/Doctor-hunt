// import 'package:doctor_hunt/HomeScreen/home_screen.dart';
import 'package:doctor_hunt/Services/notification_service.dart';
import 'package:doctor_hunt/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Firebase_Backend/auth/userProvider.dart';

void main ()  async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userName = prefs.getString('userName') ?? '';
  String userEmail = prefs.getString('userEmail') ?? '';
  String userPhotoUrl = prefs.getString('userPhotoUrl') ?? '';

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  //initialization of notification service here
  await NotificationService.initializeNotificationService();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => UserProvider())
    ],
        child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        pageTransitionsTheme: const PageTransitionsTheme(builders: {
          TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder()
        }),
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const splashScreen(),
    );
  }
}
