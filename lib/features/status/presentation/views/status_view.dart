import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/status/presentation/views/widgets/add_status_list_tile.dart';
import 'package:chat_app/features/status/presentation/views/widgets/recent_update_list_tile.dart';
import 'package:chat_app/features/status/presentation/views/widgets/viewed_updates_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AddStatusListTile(),
              Gap(10.h),
              Text(
                "Recent updates,",
                style: Style.textStyle18,
              ),
              const RecentUpdatesListTile(),
              Gap(15.h),
              Text(
                "Viewed updates",
                style: Style.textStyle18,
              ),
              const ViewedUpdatesListTile(),
            ],
          ),
        ),
      ),
    );
  }
}
