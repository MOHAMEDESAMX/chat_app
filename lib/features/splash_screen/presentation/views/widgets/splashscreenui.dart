

import 'package:chat_app/core/constantsss/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsImages.logo,width: 150,height: 150,),
            Text(
              "whatsUp",
              style: Style.textStyle24.copyWith(color: ColorsApp.secondaryColor),
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