import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class WaterTracker extends StatelessWidget {
  WaterTracker({
    super.key,
    this.food = false,
    this.trackerTitle,
    this.trackerIcon,
    this.workout = false,
    this.sleep=false,
  });
  final food;
  final trackerTitle;
  final trackerIcon;
  final workout;
  final sleep;

  @override
  Widget build(BuildContext context) {
    final fitnessProvider = Provider.of<FitnessProvier>(context);
   
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        (food || workout)
            ? SizedBox()
            : QuantityBtn(
                icon: Icons.remove,
                add: false,
                onTap: ()async {
                  if (sleep) {
                    fitnessProvider.decrementSleepCount();
                   await  fitnessProvider.updateFitness();
                  } else {
                    fitnessProvider.decrementWaterCount();
                   await  fitnessProvider.updateFitness();
                  }
                },
              ),
        CircularPercentIndicator(
          radius: 120.0,
          lineWidth: 8.0,
          animation: true,
          percent: food
              ? fitnessProvider.foodCount / 1587
              : workout
                  ? fitnessProvider.workCount / 60
                  : sleep
                      ? fitnessProvider.sleepCount / 8
                      : (fitnessProvider.waterCount == 9
                          ? 1.0
                          : fitnessProvider.waterCount / 9.0),
          center: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                trackerIcon,
                color: waterBlue,
                size: 40,
              ),
              kHeight,
              Text(
                trackerTitle,
                style: TextStyle(
                  color: black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              kHeight,
              Text(
                food
                    ? "${fitnessProvider.foodCount} cal /1587 cal"
                    : workout
                        ? '${fitnessProvider.workCount}min /60 minutes'
                        : sleep
                            ? "${fitnessProvider.sleepCount}hrs /8 hrs"
                            : '${fitnessProvider.waterCount}/9 glasses',
                style: TextStyle(
                  color: grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          circularStrokeCap: CircularStrokeCap.round,
          progressColor: Colors.blue,
        ),
        (food || workout)
            ? SizedBox()
            : QuantityBtn(
                icon: Icons.add,
                add: true,
                onTap: () async{
                  if (sleep) {
                    fitnessProvider.incrementSleepCount();
                    await fitnessProvider.updateFitness();
                  } else {
                    fitnessProvider.incrementWaterCount();
                   await   fitnessProvider.updateFitness();
                  }
                },
              ),
      ],
    );
  }
}

class QuantityBtn extends StatelessWidget {
  final IconData icon;
  final bool add;
  final VoidCallback onTap;

  QuantityBtn({required this.icon, required this.add, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height / 20,
        width: MediaQuery.of(context).size.width / 10,
        decoration: BoxDecoration(
          color: white,
          border: Border.all(width: 1, color: grey),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Icon(icon)),
      ),
    );
  }
}
