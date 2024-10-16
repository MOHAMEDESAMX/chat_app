import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/features/auth/presentation/views/otp_page.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_app_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int myIndex=0;
  List<Widget> pagesList=[
    const HomeBody(),
    const OtpView(),
    //StatusBody(),
    //CallsBody(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        onTap: (index){
          setState(() {
            myIndex=index;
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
      
    );
  }
}
