import 'package:chat_app/core/themes/color_app.dart';
import 'package:chat_app/features/home/presentation/views/widgets/Inbox_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class InboxBody extends StatelessWidget {
  InboxBody({
    super.key,
  });
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mywidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              SizedBox(
                width: mywidth - 62.w,
                child: InboxTextFiled(
                  controller: controller,
                ),
              ),
              Gap(3.w),
              CircleAvatar(
                radius: 22.r,
                backgroundColor: ColorsApp.primaryColor,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.mic_outlined,
                    color: Colors.white,
                    size: 20.r,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
