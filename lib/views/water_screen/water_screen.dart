import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/workout_screen/widget/delete_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/custom_app_bar.dart';
import 'widget/message_bar.dart';
import 'widget/water_tracker.dart';

class WaterDetailsScreen extends StatelessWidget {
  const WaterDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar2(title: 'Water Tracker'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const MessageBar(title: '70% of human body is water'),
          DeleteBtn(
          delFun: () {
            Provider.of<FitnessProvier>(context, listen: false)
                .deleteWaterCount();
          },
        ),
          Expanded(
            child: Center(
              child: WaterTracker(
                trackerTitle: 'Water Tracker',
                trackerIcon: Icons.water_drop_outlined,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
