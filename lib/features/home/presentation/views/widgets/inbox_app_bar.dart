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
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
