








import 'package:flutter/material.dart';



class ColorConstants {
  static  Color maniColor = hexToColor("#F57A07");
 static  Color backGroundColor = hexToColor("#ECE5DB");
 static Color  secondBgColor = hexToColor("#D1B893");
 static Color sideBarLinerColor = hexToColor("#483D27");
 static Color bottomSideColor = hexToColor("#D8B178");
 static Color bottombarButtoncolor = hexToColor("#EC9410");
}

Color hexToColor(String hex) {
  assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));

  return Color(int.parse(hex.substring(1), radix: 16) +
      (hex.length == 7 ? 0xFF000000 : 0x00000000));
}