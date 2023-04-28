import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Svg extends StatelessWidget {
  final String imagepath;
  final double width;
  final double height;
  const Svg(
      {super.key,
      required this.imagepath,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      
      imagepath,
      width: width,
      height: height,
    );
  }
}
