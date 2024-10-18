import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/data_filed.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_save_buttom.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProfileImage(),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Name",
              style: Style.textStyle18,
            ),
            const SizedBox(
              height: 10,
            ),
            const DataFiled(
              text: "Mohamed Essam",
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              "Phone",
              style: Style.textStyle18,
            ),
            const SizedBox(
              height: 10,
            ),
            const DataFiled(text: "+01282759951"),
            const SizedBox(
              height: 50,
            ),
            const ProfileSaveButtom()
          ],
        ),
      ),
    );
  }
}
