import 'package:flutter/material.dart';

import 'colors.dart';

class MyTextStyle {
  static double normalfontSize = 17;
  static double smallFontSize = 12;
  static double largeFontSize = 19;

  static TextStyle appbarText() {
    if (largeFontSize > 20) largeFontSize = 20 ;
    return TextStyle(
        fontSize: largeFontSize,
        color: Colors.blue,
        fontWeight: FontWeight.w500);
  }

  static TextStyle primaryText() {
    if (normalfontSize > 20) normalfontSize = 19;
    return TextStyle(fontSize: 12, color: kPrimaryColor);
  }

  static TextStyle primaryBoldText() {
    if (normalfontSize > 20) normalfontSize = 19;
    return TextStyle(
        fontSize: normalfontSize,
        color: kPrimaryColor,
        fontWeight: FontWeight.w600);
  }

  static TextStyle primaryLightBoldText() {
    if (normalfontSize > 20) normalfontSize = 19;
    return TextStyle(
        fontSize: normalfontSize,
        color: Colors.white,
        fontWeight: FontWeight.w600);
  }

  static TextStyle primaryLightText() {
    if (normalfontSize > 20) normalfontSize = 19;
    return TextStyle(fontSize: normalfontSize, color: Colors.white);
  }

  static TextStyle smallGreyText() {
    if (smallFontSize > 20) smallFontSize = 19;
    return TextStyle(fontSize: smallFontSize, color: kGrey);
  }
}
