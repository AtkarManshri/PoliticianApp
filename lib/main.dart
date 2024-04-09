import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:politician_app/pages/cards.dart';

import 'package:politician_app/pages/gallery.dart';
import 'package:politician_app/pages/home.dart';
import 'package:politician_app/pages/login.dart';
import 'package:politician_app/pages/navbar.dart';
import 'package:politician_app/pages/news.dart';
import 'package:politician_app/pages/opinion.dart';
import 'package:politician_app/pages/signup.dart';
import 'package:politician_app/pages/splash_screen.dart';
import 'package:politician_app/pages/vedios.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:politician_app/firebase_options.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized(); //for firebase initializae
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //  // webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  // );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splashscreen",
      theme: ThemeData(
         scaffoldBackgroundColor: Colors.blueGrey[50],
        primarySwatch: Colors.blue,
      ),
      // home: FirebaseAuth.instance.currentUser != null
      //     ? Home()
      //     : login(),
    routes:
    {
       "splashscreen":(context)=>SplashScreen(),
       'home':(context)=> Home(),
       'login':(context)=>login(),
       'signup':(context)=>signup(),
       'nav':(context)=> navbar(),
       'gallery':(context)=> gallery(),
       'vedio':(context)=> vedios(),
       'mmr':(context)=>MembershipScreen(),
       'opinion':(context)=>opinion(),
       'news':(context)=> news(),
    },
    ),
  );
}
