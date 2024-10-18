import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/status/presentation/views/widgets/add_status_list_tile.dart';
import 'package:chat_app/features/status/presentation/views/widgets/recent_update_list_tile.dart';
import 'package:chat_app/features/status/presentation/views/widgets/viewed_updates_list_tile.dart';
import 'package:flutter/material.dart';

class StatusView extends StatelessWidget {
  const StatusView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AddStatusListTile(),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Recent updates,",
              style: Style.textStyle18,
            ),
            const RecentUpdatesListTile(),
            const SizedBox(
              height: 15,
            ),
            Text(
              "Viewed updates",
              style: Style.textStyle18,
            ),
            const ViewedUpdatesListTile(),
          ],
        ),
      ),
    );
  }
}
