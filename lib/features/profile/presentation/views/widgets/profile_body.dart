import 'dart:developer';

import 'package:chat_app/core/themes/style.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/data_filed.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_image.dart';
import 'package:chat_app/features/profile/presentation/views/widgets/profile_save_buttom.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({
    super.key,
  });

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  Map<String, dynamic>? currentuUerData;
  getCurrentUserData() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      String uid = currentUser.uid;
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection("users").doc(uid).get();
      if (userDoc.exists) {
        var userData = userDoc.data() as Map<String, dynamic>?;
        log(userData.toString());
        setState(() {
          currentuUerData = userData;
        });
      } else {
        log("No data found for the current user");
      }
    } else {
      log("No user is logged in");
    }
  }

  @override
  void initState() {
    super.initState();
    getCurrentUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileImage(),
              Gap(10.w),
              const Divider(),
              Gap(10.h),
              Text(
                "Name",
                style: Style.textStylelabel14,
              ),
              Gap(5.h),
              DataFiled(
                text: currentuUerData != null
                    ? currentuUerData!['name']?.split(' ').first ?? 'Guest'
                    : 'Loading...',
              ),
              Gap(25.h),
              Text(
                "Phone",
                style: Style.textStylelabel14,
              ),
              Gap(5.h),
              DataFiled(text: currentuUerData!['phone']),
              Gap(25.h),
              const ProfileSaveButtom()
            ],
          ),
        ),
      ),
    );
  }
}
