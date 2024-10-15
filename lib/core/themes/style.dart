




import 'package:chat_app/core/themes/color_app.dart';
import 'package:flutter/material.dart';

abstract class Style {
  static TextStyle textStyle24 = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
  static TextStyle textStyle10 =const TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w600,
    color: ColorsApp.primaryColor,
  );
  static const textstyle20 =TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: ColorsApp.secondaryColor,
  );
}