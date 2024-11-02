import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CallsListView extends StatelessWidget {
  const CallsListView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 40.r,
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              title,
              style: Style.textStyle24.copyWith(fontSize: 18.sp),
            ),
            subtitle: Row(
              children: [
                Icon(
                  (index == 4 || index == 9)
                      ? Icons.subdirectory_arrow_right
                      : Icons.subdirectory_arrow_left,
                  color: (index == 4 || index == 9) ? Colors.green : Colors.red,
                ),
                Text(
                  subTitle,
                  style: Style.textStylelabel14,
                )
              ],
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  (index == 5 || index == 7) ? Icons.videocam : Icons.call,
                  color: ColorsApp.secondaryColor,
                )),
          );
        },
        separatorBuilder: (context, index) => Gap(15.h),
        itemCount: 10);
  }
}
