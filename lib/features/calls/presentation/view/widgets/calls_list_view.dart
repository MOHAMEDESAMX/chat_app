import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';

class CallsListView extends StatelessWidget {
  const CallsListView({
    super.key,
    required this.title,
    required this.subTitle,
    required this.image,
  });
  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            title: Text(
              title,
              style: Style.textStyle24.copyWith(fontSize: 20),
            ),
            subtitle: Row(
              children: [
                Icon(
                  (index == 4 || index == 9)
                      ? Icons.subdirectory_arrow_right
                      : Icons.subdirectory_arrow_left,
                  color: (index == 4 || index == 9) ? Colors.green : Colors.red,
                ),
                Text(
                  subTitle,
                  style: Style.textStyle18,
                )
              ],
            ),
            trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  (index == 5 || index == 7) ? Icons.videocam : Icons.call,
                  color: ColorsApp.secondaryColor,
                )),
          );
        },
        separatorBuilder: (context, index) => const SizedBox(
              height: 15,
            ),
        itemCount: 10);
  }
}
