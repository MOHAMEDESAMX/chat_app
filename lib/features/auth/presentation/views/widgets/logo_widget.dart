import 'package:chat_app/core/constants/assets_images.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 250,
      child: Image.asset(AssetsImages.logo),
    );
  }
}
