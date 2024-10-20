import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/features/home/presentation/view_model/users_list.dart';
import 'package:chat_app/features/home/presentation/views/inbox_view.dart';
import 'package:chat_app/features/home/presentation/views/widgets/slide_page_route.dart';
import 'package:flutter/material.dart';

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
              radius: 30,
              backgroundImage: AssetImage(users[index].imageUrl),
            ),
            title: Text(users[index].username),
            subtitle: Text(users[index].number),
            trailing: Column(
              children: [
                Text(users[index].time),
                const Spacer(),
                CircleAvatar(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green,
                  radius: 13,
                  child: Text(users[index].notificatonNumber),
                )
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
        separatorBuilder: (context, index) => const SizedBox(
          height: 10,
        ),
        itemCount: users.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: ColorsApp.secondaryColor,
        child: const Icon(Icons.chat),
      ),
    );
  }
}
