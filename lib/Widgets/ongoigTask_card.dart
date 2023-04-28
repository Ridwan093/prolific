import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:prolific/Widgets/progressBar.dart';
import 'package:prolific/color_folder/allColors.dart';
import 'package:prolific/demo_image_link/images.dart';
import 'package:prolific/fonts/font_names.dart';

class OngoingTask extends StatelessWidget {
  final String workName;
  final String timeAsign;
  final String tasktime;
  OngoingTask(
      {super.key,
      required this.workName,
      required this.timeAsign,
      required this.tasktime});
  List<String> userAsign = [urlprofile5, urlprofile6, urlprofile7, urlProfil];
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(12),
      elevation: 10,
      child: Container(
        height: 230,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(12)),
        child: ListView(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      workName,
                      style: TextStyle(
                          fontFamily: shipporiAntique,
                          color: Colors.black,
                          fontSize: 23),
                    ),
                    Text(
                      "Co Corker",
                      style: TextStyle(
                          fontFamily: shipporiAntique,
                          color: ColorConstants.searchFildColors,
                          fontSize: 23),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  width: 60,
                  decoration: BoxDecoration(
                      color: const Color(0xFF0EE2E2),
                      borderRadius: BorderRadius.circular(17)),
                  child: Center(
                    child: Text(timeAsign),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 50,
                          width: 300,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: userAsign
                                .map((e) => Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 30,
                                          backgroundImage: NetworkImage(e),
                                        ),
                                        Positioned(
                                            right: 3,
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
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.access_time,
                            color: Color(0xFF725E5E),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            tasktime,
                            style: TextStyle(
                                fontFamily: shipporiAntique, fontSize: 16),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                  
                const Flexible(
                  child: SizedBox(
                      height: 100,
                      child: MyProgressIndicator(
                          totalTasks: 10, completedTasks: 5)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
