import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/features/home/presentation/views/widgets/Inbox_text_filed.dart';
import 'package:flutter/material.dart';

class InboxBody extends StatelessWidget {
  InboxBody({
    super.key,
  });
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              SizedBox(
                height: 50,
                width: 730,
                child: InboxTextFiled(
                  controller: controller,
                ),
              ),
              const Spacer(),
              CircleAvatar(
                radius: 23,
                backgroundColor: ColorsApp.primaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.mic_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
