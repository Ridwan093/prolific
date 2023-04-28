import 'package:flutter/material.dart';
import 'package:prolific/Admin/Admin_widget/admin_dropDown_widget.dart';
import 'package:prolific/fonts/font_names.dart';

class Personel extends StatelessWidget {
  Personel({super.key});

  final dicrbController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Description",
            style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: "Add Descriptions...",
                hintStyle:
                    TextStyle(fontFamily: shipporiAntique, color: Colors.grey)),
            controller: dicrbController,
            maxLines: 5,
          ),
          Stack(
        
            children: [
              Positioned(
                child: Column(
                  children: [
                    Text(
                      "Select Job Owner",
                      style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    const MyDropdownContainer(
                      jobOwner: [
                        "Mr Jonsen",
                        "Mrs JkD Alao",
                        "Folakale Jamse",
                        "Andres Williams",
                        "GreenWood Masson",
                        "Click Abue"
                            "Select Task Creator"
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30,),
              Column(
                children: [
                  Text(
                    "Select Task Creator",
                    style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const MyDropdownContainer(
                    jobOwner: [
                      "Mr Jonsen",
                      "Mrs JkD Alao",
                      "Folakale Jamse",
                      "Andres Williams",
                      "GreenWood Masson",
                      "Click Abue"
                          "Select Task Creator"
                    ],
                  ),
         
                ],
              )
            ],
          )
          //  Column(
          //   children: [
          //      Text(
          //     "Select Job Owner",
          //     style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
          //   ),
          //   const SizedBox(
          //     height: 4,
          //   ),
          //   const MyDropdownContainer(
          //     jobOwner: [
          //       "Mr Jonsen",
          //       "Mrs JkD Alao",
          //       "Folakale Jamse",
          //       "Andres Williams",
          //       "GreenWood Masson",
          //       "Click Abue"
          //           "Select Task Creator"
          //     ],
          //   )
          //   ],
          //  )
        ],
      ),
    ));
  }
}
