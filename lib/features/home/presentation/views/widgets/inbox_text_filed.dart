// ignore_for_file: file_names

import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';

class InboxTextFiled extends StatefulWidget {
  const InboxTextFiled({
    super.key, this.controller,
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
          icon: const Icon(
            Icons.emoji_emotions_outlined,
            color: Colors.grey,
            size: 27,
          ),
        ),
        hintText: "Message",
        hintStyle: const TextStyle(
          fontSize: 18,
        ),
        suffixIcon: (widget.controller!.text.isNotEmpty)
            ? IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: ColorsApp.secondaryColor,
                ))
            : SizedBox(
                width: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file_outlined,
                        color: Colors.grey,
                        size: 27,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.photo_camera,
                        color: Colors.grey,
                        size: 27,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
