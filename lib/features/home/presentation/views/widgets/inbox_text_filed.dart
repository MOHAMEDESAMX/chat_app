// ignore_for_file: file_names

import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InboxTextFiled extends StatefulWidget {
  const InboxTextFiled({
    super.key,
    this.controller,
  });
  final TextEditingController? controller;

  @override
  State<InboxTextFiled> createState() => _InboxTextFiledState();
}

class _InboxTextFiledState extends State<InboxTextFiled> {
  @override
  void initState() {
    super.initState();

    widget.controller!.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    widget.controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
          vertical: 10.0,
          horizontal: 20.0,
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(35),
          borderSide: const BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(35),
        ),
        prefixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.grey,
            size: 24.r,
          ),
        ),
        hintText: "Message",
        hintStyle: TextStyle(
          fontSize: 14.sp,
        ),
        suffixIcon: (widget.controller!.text.isNotEmpty)
            ? IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.send,
                  color: ColorsApp.secondaryColor,
                  size: 24.r,
                ))
            : SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.photo_camera,
                        color: Colors.grey,
                        size: 24.r,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
