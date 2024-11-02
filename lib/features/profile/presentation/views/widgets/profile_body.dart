import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/data_filed.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_save_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              Gap(10.w),
              const Divider(),
              Gap(10.h),
              Text(
                "Name",
                style: Style.textStylelabel14,
              ),
              Gap(5.h),
              const DataFiled(
                text: "Mohamed Essam",
              ),
              Gap(25.h),
              Text(
                "Phone",
                style: Style.textStylelabel14,
              ),
              Gap(5.h),
              const DataFiled(text: "+01282759951"),
              Gap(25.h),
              const ProfileSaveButtom()
            ],
          ),
        ),
      ),
    );
  }
}
