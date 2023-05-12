import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:untitled/view/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  @override
  void initState() {
    super.initState();
    _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
    );
    _firebaseMessaging.getToken().then((token) {
      print('FCM Token: $token');
    });
    FirebaseMessaging.onMessage.listen((message) {
      print('Received message: ${message.notification!.body}');
      RemoteNotification ? notification = message.notification!;
      AndroidNotification? android = message.notification!.android;

      if (notification != null && android != null) {
        FlutterLocalNotificationsPlugin().show(
            notification.hashCode,
            notification.title,
            notification.body,
            const NotificationDetails(
              android: AndroidNotificationDetails(
                  'channel_id', 'channel_name',
                 channelDescription: 'kkbvhjbvhj',
                  icon: '@mipmap/ic_launcher',
                  priority: Priority.high, importance: Importance.max
              ),
            ));
      }
    });
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(

        child: Text("This is Splash",style: TextStyle(color: Colors.black),),
      ),
    );
  }
}
