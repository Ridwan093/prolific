import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:prolific/color_folder/allColors.dart';

class ImageWithPlaceholder extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;

  ImageWithPlaceholder(
      {required this.imageUrl, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      errorWidget: (context, url, error) => const Icon(
        Icons.network_locked,
        color: Colors.white,
        size: 30,
      ),
      placeholder: (context, url) => Center(
          child: CircularProgressIndicator(
        color: Colors.white,
        valueColor: AlwaysStoppedAnimation(ColorConstants.mainColor),
      )),
    );
  }
}
