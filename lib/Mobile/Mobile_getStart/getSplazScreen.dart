import 'dart:async';

import 'package:flutter/material.dart';
import 'package:prolific/Mobile/Mobile_getStart/getStartScreen.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/common/svg.dart';

class MobileSplaScre extends StatefulWidget {
  const MobileSplaScre({super.key});

  @override
  State<MobileSplaScre> createState() => _MobileSplaScreState();
}

class _MobileSplaScreState extends State<MobileSplaScre> {
  @override
  void initState() {
    super.initState();
    navigateAfterSecons();
  }

  void navigateAfterSecons() {
    Timer(const Duration(milliseconds: 2000), (() {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: ((context) => const GetstartScreen())));
    }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: ColorConstants.mainColor,
      height: size.height,
      width: size.width,
      child: const Center(
        child: Svg(
          height: 70,
          width: 50,
          imagepath: "assets/logo.svg",
        ),
      ),
    ));
  }
}
