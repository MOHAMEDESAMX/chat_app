import 'package:chat_app/features/profile/presentation/views/profile_view.dart';
import 'package:flutter/material.dart';

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
      leading: Container(
        margin: const EdgeInsets.all(3),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black,
          ),
        ),
      ),
      title: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(userImage),
          ),
          const SizedBox(
            width: 7,
          ),
          Text(
            userName,
            style: const TextStyle(
                fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.videocam,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone,
            color: Colors.black,
          ),
        ),
        PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
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
