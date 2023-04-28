import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:prolific/Widgets/ongoigTask_card.dart';
import 'package:prolific/Widgets/working_card.dart';
import 'package:prolific/color_folder/allColors.dart';

import 'package:prolific/demo_image_link/images.dart';
import 'package:prolific/fonts/font_names.dart';

class UserDasbord extends StatelessWidget {
  const UserDasbord({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    
    return Scaffold(
      backgroundColor: ColorConstants.backGroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SafeArea(
                  child: SizedBox(
                    height: 100,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: ColorConstants.searchFildColors,
                              borderRadius: BorderRadius.circular(23)),
                          child: TextField(
                            autofocus: false,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(23)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(23)),
                                hintText: "Search",
                                hintStyle: TextStyle(
                                    fontFamily: montserrat,
                                    color: Color(0xFF725E5E),
                                    fontSize: 20),
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xFF725E5E),
                                )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Stack(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(urlProfil),
                            ),
                            Positioned(
                                right: 3,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor: ColorConstants.ativeColor,
                                  radius: 6,
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Text(
                  "Welcome!",
                  style: TextStyle(
                      color: const Color(0xFF725E5E),
                      fontFamily: montserrat,
                      fontWeight: FontWeight.bold,
                      fontSize: 19),
                ),
                Text(
                  "Henry Rick",
                  style: TextStyle(
                      fontFamily: montserrat,
                      color: Color(0xFF3A3A3A),
                      fontSize: 25,
                      fontWeight: FontWeight.w900),
                ),
                Text(
                  "0 Task Pending",
                  style: TextStyle(
                      fontFamily: montserrat,
                      color: Color(0xFFFF0F00),
                      fontSize: 18,
                      fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
                      style: TextStyle(
                          fontFamily: montserrat,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFF3A3A3A)),
                    ),
                    Column(
                      children: [
                        Stack(
                          children: [
                            Image.asset(
                              "assets/messagIcons.png",
                              height: 60,
                            ),
                            Positioned(
                                right: 10,
                                child: Text(
                                  '0',
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.mrDafoe().fontFamily,
                                      fontSize: 25,
                                      color: const Color(0xFFFF0F00),
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        )
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Working_card(
                      url: personelUrl,
                      ontap: () {},
                    ),
                    Working_card(
                      url: teamworkcardLink,
                      ontap: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 34,
                ),
                Text(
                  "Ongoing Task",
                  style: TextStyle(
                      fontFamily: montserrat,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3A3A3A)),
                ),
                const SizedBox(height: 10,),
                OngoingTask(timeAsign: '4d',workName: 'Abc Task',tasktime: "1:30pm - 1:50pm",),
                const SizedBox(height: 30,),
                Text(
                  "Ongoing Task",
                  style: TextStyle(
                      fontFamily: montserrat,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF3A3A3A)),
                ),
                const SizedBox(height: 10,),
                OngoingTask(timeAsign: '3d',workName: 'jonh Task',tasktime: "1:50pm - 3:50pm",),
                
              ],
            )),
      ),
    );
  }
}
