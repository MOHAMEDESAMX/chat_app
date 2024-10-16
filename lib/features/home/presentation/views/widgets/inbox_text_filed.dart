
// ignore_for_file: file_names

import 'package:flutter/material.dart';

class InboxTextFiled extends StatelessWidget {
  const InboxTextFiled({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(right: 10, left: 10),
          filled: true,
          fillColor: Colors.white,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(35)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(35)),
          prefixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.emoji_emotions_outlined,
              color: Colors.grey,
              size: 30,
            ),
          ),
          hintStyle: const TextStyle(fontSize: 18),
          hintText: "Message",
          suffix: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.attach_file_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                  size: 30,
                ),
              ),
            ],
          )),
    );
  }
}
