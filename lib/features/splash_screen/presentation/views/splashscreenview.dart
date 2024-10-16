import 'dart:async';
import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AssetsImages.logo,
              width: 150,
              height: 150,
            ),
            Text(
              "whatsUp",
              style:
                  Style.textStyle24.copyWith(color: ColorsApp.secondaryColor),
            ),
            const SizedBox(height: 100),
            Text(
              "The best chat app of this century ♥",
              style: Style.textStyle24.copyWith(fontSize: 15),
            ),
          ],
        ),
      ),
    );
  }
}
