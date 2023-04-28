

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prolific/fonts/font_names.dart';

class AdminTiles extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  const AdminTiles({super.key, required this.title, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      title: Text(title,style: TextStyle(
        fontFamily: ntoSans,
        fontSize: 20,
        color: Colors.white
      ),),
    );
  }
}