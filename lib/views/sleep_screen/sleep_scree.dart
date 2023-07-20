import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/water_screen/widget/custom_app_bar.dart';
import 'package:fit/views/water_screen/widget/message_bar.dart';
import 'package:fit/views/water_screen/widget/water_tracker.dart';
import 'package:fit/views/workout_screen/widget/delete_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SleepScreen extends StatelessWidget {
  const SleepScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(title: 'Sleep Tracker'),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const MessageBar(
              title: 'Humans sleep for ~25 years in their lifetime'),
          DeleteBtn(
            delFun: () {
              Provider.of<FitnessProvier>(context, listen: false)
                  .deleteSleepCount();
            },
          ),
          Expanded(
            child: WaterTracker(
              trackerIcon: Icons.nightlight_outlined,
              trackerTitle: 'Sleep Tracker',
              sleep: true,
            ),
          ),
        ],
      ),
    );
  }
}
