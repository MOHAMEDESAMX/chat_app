import 'package:chat_app/core/constants/assets_images.dart';
import 'package:chat_app/features/calls/presentation/view/widgets/calls_list_view.dart';
import 'package:flutter/material.dart';

class CallsBody extends StatelessWidget {
  const CallsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
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
