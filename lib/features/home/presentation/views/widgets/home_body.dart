import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/home/data/users_list.dart';
import 'package:chat_app/features/home/presentation/views/inbox_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/slide_page_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({
    super.key,
  });

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<QueryDocumentSnapshot> usersData = [];
  bool isloading = true;
  getUsersData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("users").get();
    usersData.addAll(querySnapshot.docs);
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    getUsersData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    radius: 30.r,
                    backgroundImage: AssetImage(users[index].imageUrl),
                  ),
                  title: Text(
                    "${usersData[index]["name"]}",
                    style: Style.textStyleusername18,
                  ),
                  subtitle: Text(
                    "${{usersData[index]["phone"]}}",
                    style: Style.textStyle14,
                  ),
                  trailing: Column(
                    children: [
                      Text(
                        users[index].time,
                      ),
                      const Spacer(),
                      CircleAvatar(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                        radius: 13.r,
                        child: Text(users[index].notificatonNumber),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      SlidePageRoute(
                        page: InboxView(
                          userImage: users[index].imageUrl,
                          userName: "${usersData[index]["name"]}",
                        ),
                      ),
                    );
                  },
                );
              },
              separatorBuilder: (context, index) => Gap(10.h),
              itemCount: usersData.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.secondaryColor,
        child: const Icon(
          Icons.chat,
          color: Colors.white,
        ),
      ),
    );
  }
}
