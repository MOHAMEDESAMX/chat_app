import 'package:chat_app/features/profile/presentation/views/widgets/profile_app_bar.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ProfileAppBar(),
      body: ProfileBody(),
    );
  }
}
