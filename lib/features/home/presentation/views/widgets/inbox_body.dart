import 'package:chat_app/features/home/presentation/views/widgets/Inbox_text_filed.dart';
import 'package:flutter/material.dart';

class InboxBody extends StatelessWidget {
  const InboxBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Spacer(),
          InboxTextFiled(),
        ],
      ),
    );
  }
}
