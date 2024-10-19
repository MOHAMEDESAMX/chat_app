import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/features/calls/presentation/view/calls_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_body.dart';
import 'package:chat_app/features/home/presentation/views/widgets/side_menu__view.dart';
import 'package:chat_app/features/status/presentation/views/status_view.dart';
import 'package:flutter/material.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<SideMenuState> sideMenuKey = GlobalKey<SideMenuState>();

  int myIndex = 0;
  List<Widget> pagesList = [
    const HomeBody(),
    const StatusView(),
    const CallsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return SideMenu(
      background: ColorsApp.secondaryColor,
      key: sideMenuKey,
      type: SideMenuType.slideNRotate,
      inverse: true,
      menu: const SideMenuView(),
      child: Scaffold(
        appBar: HomeAppBar(
          sideMenuKey: sideMenuKey,
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat,
                color: ColorsApp.secondaryColor,
              ),
              label: "Chats",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.tips_and_updates,
                color: ColorsApp.secondaryColor,
              ),
              label: "Status",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.call,
                color: ColorsApp.secondaryColor,
              ),
              label: "Calls",
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: pagesList[myIndex],
      ),
    );
  }
}
