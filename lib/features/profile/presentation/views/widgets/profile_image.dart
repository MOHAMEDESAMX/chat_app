import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 100.r,
            backgroundImage: const AssetImage(AssetsImages.me),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              height: 35.h,
              width: 35.w,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsApp.secondaryColor,
              ),
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
