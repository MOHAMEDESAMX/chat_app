import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:easy_loading_button/easy_loading_button.dart';

class ProfileSaveButton extends StatefulWidget {
  const ProfileSaveButton({super.key,required this.onPressed});

  final void Function()? onPressed;
  @override
  State<ProfileSaveButton> createState() => _ProfileSaveButtonState();
}

class _ProfileSaveButtonState extends State<ProfileSaveButton> {

  @override
  Widget build(BuildContext context) {
    return EasyButton(
      type: EasyButtonType.elevated,
      elevation: 2,
      onPressed: widget.onPressed,
      borderRadius: 25.r,
      useWidthAnimation: true,
      useEqualLoadingStateWidgetDimension: true,
      width: double.infinity,
      height: 65.h,
      contentGap: 6,
      buttonColor: ColorsApp.secondaryColor,
      idleStateWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.save,
            color: Colors.white,
            size: 25.r,
          ),
          Gap(10.w),
          Text(
            "Save Profile",
            style: TextStyle(
              fontSize: 18.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      loadingStateWidget: const CircularProgressIndicator(
        strokeWidth: 3.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white,
        ),
      ),
    );
  }
}
