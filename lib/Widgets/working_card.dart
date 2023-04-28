



// ignore_for_file: camel_case_types



import 'package:flutter/material.dart';

class Working_card extends StatelessWidget {
  final String url;

  final VoidCallback ontap;
  const Working_card({super.key, required this.url, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: ontap,
        child: Image.network(url),
      ),
    );
  }
}