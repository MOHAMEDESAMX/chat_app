import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function()? onPressed;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final TextInputType? keyboardType;

  const CustomTextFormField(
      {super.key,
      this.hintText,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.obscureText,
      this.validator,
      this.controller,
      this.keyboardType,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: label ?? "",
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: (suffixIcon) != null
            ? IconButton(
                onPressed: onPressed,
                icon: Icon(suffixIcon),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.r),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.secondaryColor, width: 2),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      style: TextStyle(
        fontSize: 16.sp,
      ),
    );
  }
}
