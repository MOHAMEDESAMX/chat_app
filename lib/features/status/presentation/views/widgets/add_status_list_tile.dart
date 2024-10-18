import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:flutter/material.dart';

class AddStatusListTile extends StatelessWidget {
  const AddStatusListTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: Stack(
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage(
                AssetsImages.me,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border:
                        Border.all(color: ColorsApp.secondaryColor, width: 2)),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.add,
                      color: ColorsApp.secondaryColor,
                      size: 15,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        title: Text(
          "My Status",
          style: Style.textStyle24.copyWith(fontSize: 20),
        ),
        subtitle: Text(
          "Tap to add status update",
          style: Style.textStyle18,
        ),
      ),
    );
  }
}
