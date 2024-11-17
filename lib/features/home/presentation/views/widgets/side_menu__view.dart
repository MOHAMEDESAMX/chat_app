import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/services/auth_services.dart';
import 'package:chat_app/features/auth/presentation/views/login_view.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/side_menu_row.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class SideMenuView extends StatelessWidget {
  SideMenuView({
    super.key,
  });
  final user = AuthServices();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 80.r,
          backgroundImage: const AssetImage(AssetsImages.me),
        ),
        Gap(20.h),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 25.sp,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Mohamed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Gap(50.h),
        SideMenuRow(
          icon: Icons.home,
          text: "Home",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          },
        ),
        Gap(10.h),
        SideMenuRow(
          icon: Icons.person,
          text: "Profile",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfileView(),
              ),
            );
          },
        ),
        SideMenuRow(
          icon: Icons.three_p_outlined,
          text: "New Group",
          onTap: () {},
        ),
        SideMenuRow(
          icon: Icons.settings,
          text: "Settings",
          onTap: () {},
        ),
        SideMenuRow(
          icon: Icons.logout,
          text: "Logout",
          onTap: () {
            user.signout();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginView(),
              ),
            );
          },
        ),
      ],
    );
  }
}
