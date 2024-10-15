import 'package:chat_app/core/shared_widgets/custom_text_formfiled.dart';
import 'package:flutter/material.dart';

class PasswordFiled extends StatelessWidget {
  const PasswordFiled({
    super.key,
    required this.passwordController,
    required this.isNotVisible,
    required this.toggleVisibility,
  });

  final TextEditingController passwordController;
  final bool isNotVisible;
  final Function() toggleVisibility;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      label: "Enter Yor Password",
      hintText: "your password",
      keyboardType: TextInputType.visiblePassword,
      obscureText: isNotVisible,
      prefixIcon: Icons.lock,
      suffixIcon: (isNotVisible) ? Icons.visibility_off : Icons.visibility,
      onPressed: toggleVisibility,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your password";
        }
        return null;
      },
      
    );
  }
}
