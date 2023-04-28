import 'package:flutter/material.dart';
import 'package:prolific/Admin/Admin_widget/adminLisTile.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/fonts/font_names.dart';

class DrawerItems extends StatelessWidget {
  const DrawerItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: ColorConstants.adminBgColor,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10, bottom: 20),
              child: Text(
                'HI Admin',
                style: TextStyle(
                  fontFamily: ntoSans,
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
              child: Text(
                "Last Login:\n15 Apr 2023 11:29:15 AM",
                style: TextStyle(
                  fontFamily: ntoSans,
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Create Team", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "View Staff", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Assigned Task", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Completed Task", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Incomplete Task", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Add Staff", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "View Feedback", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Settings", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Rate our service", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Switch User", ontap: (() {})),
            const Divider(
              color: Colors.white,
            ),
            AdminTiles(title: "Log out", ontap: (() {}))
          ],
        ),
      ),
    ));
  }
}
