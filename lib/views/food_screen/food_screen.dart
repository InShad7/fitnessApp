import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/home_screen/widget/item_tile.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/water_screen/widget/custom_app_bar.dart';
import 'package:fit/views/water_screen/widget/water_tracker.dart';
import 'package:fit/views/workout_screen/widget/delete_btn.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodScreen extends StatelessWidget {
  const FoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const CustomAppBar2(title: 'Food Tracker'),
      body: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
        DeleteBtn(
          delFun: () {
            Provider.of<FitnessProvier>(context, listen: false)
                .deleteFoodCount();
          },
        ),
        WaterTracker(
          trackerTitle: 'Food Tracker',
          food: true,
          trackerIcon: Icons.restaurant_rounded,
        ),
        kHeight,
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return ItemTile(
              index: index,
              food: true,
              subTitle: Provider.of<FitnessProvier>(context).foodCount,
            );
          },
        )
      ]),
    );
  }
}
