import 'package:chat_app/core/constantsss/assets_images.dart';
import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Chats extends StatelessWidget {
  final String name;
  final String time;
  final String phone;
  final ImageProvider backgroundImage;

  const Chats({
    super.key,
    required this.name,
    required this.time,
    required this.phone,
    this.backgroundImage = const AssetImage(AssetsImages.logo),
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: backgroundImage,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween ,
                    children: [
                      Text(
                        "# $phone",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      const Icon(
                        Icons.circle_notifications,
                        color: ColorsApp.secondaryColor,
                        size: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}