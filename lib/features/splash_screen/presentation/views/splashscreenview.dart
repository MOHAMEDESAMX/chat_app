
import 'dart:async';

import 'package:chat_app/features/home/presentation/views/home.dart';
import 'package:chat_app/features/splash_screen/presentation/views/widgets/splashscreenui.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context)=>const HomePage()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreenUi();
  }
}