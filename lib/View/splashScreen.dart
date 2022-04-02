import 'dart:io';

import 'package:cupidknot/View/profilescreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'login_screen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> isAuthenticated() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isAuthenticated") ?? false) {
      // updateToken();
    }
    return prefs.getBool("isAuthenticated") ?? false;
  }

  @override
  void initState() {
    notification();
    super.initState();
  }

  void notification() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      FirebaseMessaging.onMessageOpenedApp.listen((message) {
        print('Message clicked!');
      });
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // if (_localeProvider.localeChanged) {
    //   return HomeScreen();
    // }
    return FutureBuilder(
      future: isAuthenticated(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data == true) {
            return ProfileScreen();
          } else {
            return login_screen();
          }
        }
        return Center(child: Image.asset('assets/cupidknot.jpg'));
      },
    );
  }

}

