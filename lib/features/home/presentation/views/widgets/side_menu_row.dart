import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SideMenuRow extends StatelessWidget {
  const SideMenuRow({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });
  final IconData icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.green.shade300,
      child: SizedBox(
        height: 50.h,
        width: 250.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Gap(60.h),
            Icon(
              icon,
              color: Colors.white,
              size: 25.r,
            ),
            Gap(30.h),
            Text(
              text,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
