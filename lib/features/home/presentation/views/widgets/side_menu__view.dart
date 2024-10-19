import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/features/home/presentation/views/home_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/side_menu_row.dart';
import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

class SideMenuView extends StatelessWidget {
  const SideMenuView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 80,
        ),
        const CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(AssetsImages.me),
        ),
        const SizedBox(
          height: 20,
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                color: Colors.white38,
                fontSize: 30,
              ),
              textAlign: TextAlign.start,
            ),
            Text(
              "Mohamed",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 70,
        ),
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
        const SizedBox(
          height: 10,
        ),
        SideMenuRow(
          icon: Icons.person,
          text: "Profile",
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfileView(),
                ));
          },
        )
      ],
    );
  }
}
