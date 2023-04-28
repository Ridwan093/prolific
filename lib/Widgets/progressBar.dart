import 'package:flutter/material.dart';
import 'package:prolific/color_folder/allColors.dart';

class MyProgressIndicator extends StatelessWidget {
  final int totalTasks;
  final int completedTasks;

  const MyProgressIndicator({required this.totalTasks, required this.completedTasks});

  @override
  Widget build(BuildContext context) {
    double progressPercentage = completedTasks / totalTasks;

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 80,
          width: 80,
          child: CircularProgressIndicator(
            strokeWidth: 7,
            value: progressPercentage,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(ColorConstants.mainColor),
          ),
        ),
        Text(
          '${(progressPercentage * 100).toStringAsFixed(0)}%',
          style: TextStyle(fontSize: 20),
        ),
      ],
    );
  }
}
