import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle urbanist(
      {double? fontSize, FontWeight? fontWeight, Color? color}) {
    var textStyle = TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        fontFamily: "urbanist");
    return textStyle;
  }

}