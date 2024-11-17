import 'dart:async';

import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.sideMenuKey,
  });
  final GlobalKey<SideMenuState> sideMenuKey;
  @override
  State<HomeAppBar> createState() => _HomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 1);
}

class _HomeAppBarState extends State<HomeAppBar> {
  Timer? _menuCloseTimer;

  @override
  void dispose() {
    _menuCloseTimer?.cancel();
    super.dispose();
  }

  void toggleSideMenu() {
    final state = widget.sideMenuKey.currentState;
    if (state!.isOpened) {
      state.closeSideMenu();
      _menuCloseTimer?.cancel();
    } else {
      state.openSideMenu();
      _menuCloseTimer = Timer(
        const Duration(seconds: 30),
        () {
          if (mounted) {
            state.closeSideMenu();
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Container(
            color: Colors.grey,
            height: 1,
          )),
      title: Text(
        "whatsUp",
        style: Style.textStyle22,
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
        IconButton(onPressed: toggleSideMenu, icon: const Icon(Icons.more_vert))
      ],
    );
  }
}
