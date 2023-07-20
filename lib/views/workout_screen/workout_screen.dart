import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/home_screen/widget/item_tile.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/water_screen/widget/custom_app_bar.dart';
import 'package:fit/views/water_screen/widget/water_tracker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/delete_btn.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar2(title: 'Workout Tracker'),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        DeleteBtn(
          delFun: () {
            Provider.of<FitnessProvier>(context, listen: false)
                .deleteWorkCount();
          },
        ),
        WaterTracker(
          trackerTitle: 'Workout Tracker',
          workout: true,
          trackerIcon: Icons.fitness_center_outlined,
        ),
        kHeight,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return ItemTile(
              index: index,
              workout: true,
              subTitle: "${Provider.of<FitnessProvier>(context).workCount} min",
            );
          },
        )
      ]),
    );
  }
}


