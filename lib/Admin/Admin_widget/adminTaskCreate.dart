import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prolific/Admin/Admin_widget/Admin_creatTask_group.dart';
import 'package:prolific/Admin/Admin_widget/admin_creatTaskPersonel.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/demo_image_link/imageWidget/cachImage.dart';
import 'package:prolific/demo_image_link/images.dart';
import 'package:prolific/fonts/font_names.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AdminTaskCreat extends StatefulWidget {
  const AdminTaskCreat({super.key});

  @override
  State<AdminTaskCreat> createState() => _AdminTaskCreatState();
}

class _AdminTaskCreatState extends State<AdminTaskCreat>
    with TickerProviderStateMixin {
  TabController? tabController;

  Color? _containerColor;
  Color? _containerColor2;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    _containerColor = const Color(0xFFEC9410);
    _containerColor2 = const Color(0xFFBCBBBB);

    // Set initial color to blue
    tabController!.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    tabController!.removeListener(_handleTabChange);
    tabController!.dispose();
    super.dispose();
  }

  void _handleTabChange() {
    setState(() {
      if (tabController!.index == 0) {
        _containerColor = const Color(0xFFEC9410);
        _containerColor2 = const Color(0xFFBCBBBB);
      } else if (tabController!.index == 1) {
        _containerColor = const Color(0xFFBCBBBB);

        _containerColor2 = const Color(0xFFEC9410);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      decoration: BoxDecoration(
          color: ColorConstants.adminBgColor,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.event,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "dd/mm/yyyy",
                      style: TextStyle(
                          fontFamily: shipporiAntique, color: Colors.grey),
                    ),
                  ],
                ),
                Text(
                  "Create Task ",
                  style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 27,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "hh : mm",
                      style: TextStyle(
                          fontFamily: shipporiAntique, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(
              color: Colors.white,
            ),
            Text(
              "Task name",
              style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Add Task name",
                  hintStyle: TextStyle(
                      fontFamily: shipporiAntique, color: Colors.grey)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Category",
              style: TextStyle(fontFamily: shipporiAntique, fontSize: 20),
            ),
            Container(
              height: 60,
              width: size.width,
              color: Colors.white,
              child: TabBar(
                  controller: tabController,
                  indicatorColor: Colors.transparent,
                  labelColor: Colors.transparent,
                  unselectedLabelColor: Colors.transparent,
                  tabs: [
                    Tab(
                      icon: Container(
                        height: 50,
                        width: 150,
                        // color: tabController!.index == 0
                        //     ? Color(0xFFEC9410)
                        //     : Color(0xFFBCBBBB),
                        decoration: BoxDecoration(
                            color: _containerColor,
                            borderRadius: BorderRadius.circular(12)),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 32,
                            ),
                            Text("Personal",
                                style: TextStyle(
                                    fontFamily: ntoSans, color: Colors.black))
                          ],
                        ),
                      ),
                    ),
                    Tab(
                      icon: Container(
                        height: 50,
                        width: 150,
                        // color: tabController!.index == 1
                        //     ? Color(0xFFEC9410)
                        //     : Color(0xFFBCBBBB),
                        decoration: BoxDecoration(
                            color: _containerColor2,
                            borderRadius: BorderRadius.circular(12)),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ImageWithPlaceholder(
                                imageUrl: teamworkUrl, width: 50, height: 50),
                            Text(
                              "Teams",
                              style: TextStyle(
                                  fontFamily: ntoSans, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                    )
                  ]),
            ),
            SizedBox(
              height: size.height / 2,
              child: TabBarView(
                controller: tabController,
                children: [Personel(), const Group()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
