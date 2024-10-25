import 'package:chat_app/core/shared_widgets/custom_text_formfiled.dart';
import 'package:flutter/material.dart';

class NameFiled extends StatelessWidget {
  const NameFiled({super.key,
  required this.nameController});
  final TextEditingController nameController;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      keyboardType: TextInputType.name,
      label: "Enter Your Name",
      hintText: "your name",
      prefixIcon: Icons.person,
      controller: nameController,
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your name";
        }
        else if (value.length < 5) {
          return "name is too short \n at least 5 letters";
        }
        return null;
      },
    );
  }
}
