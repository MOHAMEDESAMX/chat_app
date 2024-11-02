import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/home/data/users_list.dart';
import 'package:chat_app/features/home/presentation/views/inbox_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/slide_page_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 30.r,
              backgroundImage: AssetImage(users[index].imageUrl),
            ),
            title: Text(
              users[index].username,
              style: Style.textStyleusername18,
            ),
            subtitle: Text(
              users[index].number,
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
                    userName: users[index].username,
                  ),
                ),
              );
            },
          );
        },
        separatorBuilder: (context, index) => Gap(10.h),
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.secondaryColor,
        child: const Icon(Icons.chat,color: Colors.white,),
      ),
    );
  }
}
