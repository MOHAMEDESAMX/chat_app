import 'package:chat_app/core/constants/assets_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140.w,
      height: 140.h,
      child: Image.asset(AssetsImages.logo),
    );
  }
}
