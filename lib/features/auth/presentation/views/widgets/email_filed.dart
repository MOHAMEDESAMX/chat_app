import 'package:chat_app/core/shared_widgets/custom_text_formfiled.dart';
import 'package:flutter/material.dart';

class EmailFiled extends StatelessWidget {
  const EmailFiled({
    super.key,
    required this.emailController,
  });

  final TextEditingController emailController;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.emailAddress,
      label: "Enter Your Email",
      hintText: "your email",
      prefixIcon: Icons.email,
      controller: emailController,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your email";
        }
        return null;
      },
    );
  }
}
