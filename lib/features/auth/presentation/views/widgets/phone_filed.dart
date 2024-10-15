import 'package:chat_app/core/shared_widgets/custom_text_formfiled.dart';
import 'package:flutter/material.dart';

class PhoneFiled extends StatelessWidget {
  const PhoneFiled({
    super.key,
    required this.phoneController,
  });

  final TextEditingController phoneController;

  @override

  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.phone,
      label: "Enter Your Phone",
      hintText: "your phone",
      prefixIcon: Icons.phone_android,
      controller: phoneController,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your phone";
        }
        return null;
      },
    );
  }
}
