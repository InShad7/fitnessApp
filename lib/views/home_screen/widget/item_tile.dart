import 'package:fit/controller/controller.dart';
import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/food_screen/food_screen.dart';
import 'package:fit/views/sleep_screen/sleep_scree.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/water_screen/water_screen.dart';
import 'package:fit/views/workout_screen/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  const ItemTile(
      {super.key,
      this.index,
      this.food = false,
      this.workout = false,
      this.subTitle,
      this.daily = false});
  final index;
  final food;
  final workout;
  final subTitle;
  final daily;

  @override
  Widget build(BuildContext context) {
    final fitnessProvider = Provider.of<FitnessProvier>(context, listen: false);

    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 4),
      height: mHeight! / 9,
      width: mWidth,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          kWidth5,
          Icon(
            food
                ? foodIcon[index]
                : workout
                    ? workoutIcon[index]
                    : icon[index],
            size: 30,
            color: iconColor[index],
          ),
          kWidth5,
          InkWell(
            onTap: () {
              (food || workout || daily) ? null : selectTile(context);
            },
            child: Container(
              height: mHeight! / 13,
              width: mWidth! / 1.8,
              color: white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    food
                        ? foodTitle[index]
                        : workout
                            ? workoutTitle[index]
                            : title[index],
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "${subTitle}",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                (food || workout)
                    ? InkWell(
                        onTap: () async {
                          if (food) {
                            fitnessProvider.decrementFoodCount();
                            await fitnessProvider.updateFitness();
                          } else if (workout) {
                            fitnessProvider.decrementWorkCount();
                            await fitnessProvider.updateFitness();
                          } else {}
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(9),
                          ),
                          child: Icon(
                            Icons.remove,
                            size: 28,
                            color: white,
                          ),
                        ),
                      )
                    : const SizedBox(),
                InkWell(
                  onTap: () async {
                    if (food) {
                      fitnessProvider.incrementFoodCount();
                      await fitnessProvider.updateFitness();
                    } else if (workout) {
                      fitnessProvider.incrementWorkCount();
                      await fitnessProvider.updateFitness();
                    } else {
                      daily ? null : selectTile(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: black,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: daily
                        ?const SizedBox()
                        : Icon(
                            Icons.add,
                            size: 28,
                            color: white,
                          ),
                  ),
                ),
              ],
            ),
          ),
          kWidth5
        ],
      ),
    );
  }

  selectTile(context) {
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WaterDetailsScreen(),
        ),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FoodScreen(),
        ),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const WorkoutScreen(),
        ),
      );
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SleepScreen(),
        ),
      );
    }
  }
}
