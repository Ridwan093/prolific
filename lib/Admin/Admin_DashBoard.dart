// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prolific/Admin/Admin_DashBoard.dart';
import 'package:prolific/Admin/Admin_widget/adminTaskCreate.dart';
import 'package:prolific/Admin/Admin_widget/drawer_item.dart';
import 'package:prolific/Widgets/dasbord_card.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/demo_image_link/images.dart';
import 'package:prolific/fonts/font_names.dart';
import 'package:prolific/routes/simple_routs.dart';

class Admin_DashBoard extends StatelessWidget {
  Admin_DashBoard({super.key});
  List<String> userAsign = [urlprofile5, urlprofile6, urlprofile7, urlProfil];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorConstants.adminBgColor,
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back,
          color: Color(0xFF725E5E),
        ),
        backgroundColor: ColorConstants.adminBgColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Dash Board",
          style: TextStyle(
              fontFamily: montserrat,
              color: const Color(0xFF725E5E),
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      endDrawer: const DrawerItems(),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Stack(
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
                  ),
                ),
                SizedBox(
                  height: 100,
                  width: size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome!",
                            style: TextStyle(
                                color: const Color(0xFF725E5E),
                                fontFamily: montserrat,
                                fontWeight: FontWeight.bold,
                                fontSize: 19),
                          ),
                          Text(
                            "Admin!",
                            style: TextStyle(
                                fontFamily: montserrat,
                                color: const Color(0xFF3A3A3A),
                                fontSize: 25,
                                fontWeight: FontWeight.w900),
                          ),
                        ],
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
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "CO Worker",
                  style: TextStyle(
                      color: const Color(0xFF3A3A3A),
                      fontFamily: montserrat,
                      fontWeight: FontWeight.bold,
                      fontSize: 23),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 50,
                    width: 300,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: userAsign
                          .map((e) => Stack(
                                children: [
                                  CircleAvatar(
                                    radius: 35,
                                    backgroundImage: NetworkImage(e),
                                  ),
                                  Positioned(
                                      right: 7,
                                      bottom: 0,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            ColorConstants.ativeColor,
                                        radius: 6,
                                      ))
                                ],
                              ))
                          .toList(),
                    )),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      DashBordCard(
                        title: "Date",
                        subtitle: "15 Apr 2023",
                        imageUrl: calenderIconUrl,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      DashBordCard(
                        title: "Task Zone",
                        subtitle: "GMT +4",
                        imageUrl: taskZone,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 8,
                        child: AdminCard(
                          ontap: (() {

                            showModalBottomSheet(
                              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
                                context: context,
                                builder: ((context) => const AdminTaskCreat()));
                          }),
                          title: "Create Task",
                          subtitle: "12:45 PM",
                          imageUrl: createTaskUrl,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 8,
                        child: AdminCard(
                          ontap: (() {}),
                          title: "Pending Task",
                          subtitle: "07:45 PM",
                          imageUrl: pendingTaskUrl,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(12),
                        child: const DashBordCard(
                          title: "View Task",
                          subtitle: "Task",
                          imageUrl: viewTaskUrl,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(12),
                        elevation: 8,
                        child: const DashBordCard(
                          title: "Re-assign",
                          subtitle: "Task",
                          imageUrl: reAssignUrl,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Descriptions",
                  style: TextStyle(
                      fontFamily: montserrat,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Join us in solving the challenges that Foody food "
                  "industry is facing. Free of charge. Grow your "
                  "network, get expert advice and develop your "
                  "business. Join the meeting.",
                  style: TextStyle(
                    fontFamily: montserrat,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (() {
                    Routs()
                        .goTo(context: context, routeName: Admin_DashBoard());
                  }),
                  child: Container(
                    height: 50,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: const Color(0xFF7C7533),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      height: 50,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(.7),
                                Colors.black.withOpacity(.7),
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.9),
                                Colors.black
                              ])),
                      child: Center(
                        child: Text(
                          "Complete",
                          style: TextStyle(
                              fontFamily: ntoSans,
                              color: Colors.white,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}



