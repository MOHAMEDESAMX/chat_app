import 'dart:developer';

import 'package:chat_app/core/shared_widgets/custom_buttom.dart';
import 'package:chat_app/core/shared_widgets/custom_text_formfiled.dart';
import 'package:chat_app/core/themes/style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key, required this.emailController});

  final TextEditingController emailController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forget Password"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Enter your email address to receive a password reset link",
              style: Style.textStyle18.copyWith(color: Colors.grey.shade600),
            ),
            Gap(20.h),
            CustomTextFormField(
              label: "email",
              hintText: "Enter your email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(60.h),
            CustomButtom(
                onPressed: () async {
                  if (emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Email can't be empty"),
                        backgroundColor: Colors.red,
                        duration: Duration(seconds: 3),
                      ),
                    );
                    return;
                  }
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(email: emailController.text);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Email sent successfully"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 3),
                      ),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      log("$e");
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Email not found"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else if (e.code == 'invalid-email') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Invalid email format."),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content:
                              Text("Something went wrong. Try again later."),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                    log("Error during password reset: $e");
                  }
                },
                text: "Send"),
          ],
        ),
      ),
    );
  }
}
