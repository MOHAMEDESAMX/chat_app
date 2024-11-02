import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RecentUpdatesListTile extends StatelessWidget {
  const RecentUpdatesListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 500,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(
                radius: 43.r,
                backgroundColor: ColorsApp.secondaryColor,
                child: const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    AssetsImages.me,
                  ),
                ),
              ),
              title: Text(
                "Mohamed essam",
                style: Style.textStyle24.copyWith(fontSize: 20.sp),
              ),
              subtitle: Text(
                "Today, 12:00 PM",
                style: Style.textStyle18,
              ),
            );
          },
          separatorBuilder: (context, index) => Gap(10.h),
          itemCount: 7),
    );
  }
}
