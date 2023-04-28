import 'package:flutter/material.dart';
import 'package:prolific/demo_image_link/imageWidget/cachImage.dart';
import 'package:prolific/fonts/font_names.dart';

class DashBordCard extends StatelessWidget {
  final String title;

  final String subtitle;
  final String imageUrl;
  const DashBordCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 180,
      decoration: BoxDecoration(
          color:const Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: ImageWithPlaceholder(imageUrl: imageUrl,height: 50,width: 50,)),
          const SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontFamily: shipporiAntique,
                    color: const Color(0xFF8B7D7D),
                    fontSize: 17,
                    fontWeight: FontWeight.w800),
              ),
              Text(
                subtitle,
                style: TextStyle(
                    fontFamily: shipporiAntique,
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w800),
              )
            ],
          )
        ],
      ),
    );
  }
}



class AdminCard extends StatelessWidget {
  final String title;

  final String subtitle;
  final String imageUrl;
  final VoidCallback ontap;
  const AdminCard(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.imageUrl, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 100,
        width: 180,
        decoration: BoxDecoration(
            color:const Color(0xFFD9D9D9), borderRadius: BorderRadius.circular(12)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(child: ImageWithPlaceholder(imageUrl: imageUrl,height: 50,width: 50,)),
            const SizedBox(
              width: 8.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontFamily: shipporiAntique,
                      color: const Color(0xFF8B7D7D),
                      fontSize: 18,
                      fontWeight: FontWeight.w800),
                ),
                
              ],
            )
          ],
        ),
      ),
    );
  }
}
