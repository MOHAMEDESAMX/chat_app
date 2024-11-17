import 'dart:developer';

import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/splash_screen/presentation/views/splashscreenview.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

  bool loged = false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    if (user == null) {
      log('User is currently signed out!');
      loged =false;
    } else {
      log('User is signed in!');
      loged =true;
    }
  });
}



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  
}

class _MyAppState extends State<MyApp> {
  
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: (loged)? const HomePage() : const SplashScreen(),
    );
  });
}}
