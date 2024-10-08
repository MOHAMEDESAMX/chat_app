import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/home/presentation/views/widgets/chats.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> chatData = [
    {"name": "rowan", "time": "12:30 PM", "phone": "01245648551"},
    {"name": "mohamed essam", "time": "01:15 PM", "phone": "01548613551"},
    {"name": "marwan ali", "time": "09:07 AM", "phone": "01125486312"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "whatsUp",
          style: Style.textstyle20.copyWith(fontSize: 30),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ))
        ],
      ),
      backgroundColor: Colors.white,
      body: ListView.builder(
          itemCount: chatData.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Chats(
                  name: chatData[index]['name']!,
                  time: chatData[index]['time']!,
                  phone: chatData[index]["phone"]!),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.secondaryColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
