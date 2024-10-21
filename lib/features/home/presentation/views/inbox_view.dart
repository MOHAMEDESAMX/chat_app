import 'package:chat_app/features/home/presentation/views/widgets/inbox_app_bar.dart';
import 'package:chat_app/features/home/presentation/views/widgets/inbox_body.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({
    super.key,
    required this.userImage,
    required this.userName,
  });

  final String userImage;
  final String userName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: InboxAppBar(userImage: userImage, userName: userName),
      body: InboxBody(),
    );
  }
}
