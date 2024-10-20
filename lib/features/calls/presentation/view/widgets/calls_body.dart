import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/calls/presentation/view/widgets/calls_list_view.dart';
import 'package:flutter/material.dart';

class CallsBody extends StatelessWidget {
  const CallsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Resent",
              style: Style.textStyle18.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: CallsListView(
                title: "Mohamed Essam",
                subTitle: "18 Oct, 8:30 pm",
                image: AssetsImages.me,
              ),
            )
          ],
        ),
      ),
    );
  }
}
