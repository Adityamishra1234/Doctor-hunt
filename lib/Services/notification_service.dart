
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandler(RemoteMessage message)async {
  print("message received");
}

class NotificationService{
 static Future<void> initializeNotificationService() async {
    NotificationSettings notificationSettings = await FirebaseMessaging.instance.requestPermission();
    if(notificationSettings.authorizationStatus == AuthorizationStatus.authorized){

      String? token = await FirebaseMessaging.instance.getToken();
      if(token != null){
        print("token here: ${token}");
      }
      await FirebaseMessaging.instance.subscribeToTopic('all_users');
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);

      print("Notification initialized");
    }
  }
}