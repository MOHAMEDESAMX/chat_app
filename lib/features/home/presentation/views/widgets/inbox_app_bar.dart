import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InboxAppBar extends StatelessWidget implements PreferredSizeWidget {
  const InboxAppBar({
    super.key,
    required this.userImage,
    required this.userName,
  });

  final String userImage;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.black,
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 20.r,
            backgroundImage: AssetImage(userImage),
          ),
          Gap(5.w),
          Expanded(
            child: Text(
              userName,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.black,
              ),
              maxLines: 1,
              overflow: TextOverflow.fade,
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: Icon(
            Icons.videocam,
            color: Colors.black,
            size: 18.r,
          ),
        ),
        IconButton(
          constraints: const BoxConstraints(),
          onPressed: () {},
          icon: Icon(
            Icons.phone,
            color: Colors.black,
            size: 18.r,
          ),
        ),
        PopupMenuButton(
            constraints: const BoxConstraints(),
            icon: Icon(
              Icons.more_vert,
              color: Colors.black,
              size: 18.r,
            ),
            onSelected: (value) {
              if (value == "profile") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileView(),
                  ),
                );
              } else if (value == "group") {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const GroupView(),),);
              } else if (value == "settings") {
                //Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsView(),),);
              }
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: "profile",
                  child: Text("Profile"),
                ),
                const PopupMenuItem(
                  value: "group",
                  child: Text("New Group"),
                ),
                const PopupMenuItem(
                  value: "settings",
                  child: Text("Settings"),
                ),
              ];
            })
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
