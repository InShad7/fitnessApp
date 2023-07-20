import 'package:fit/views/home_screen/home_screen.dart';
import 'package:fit/views/otp_screen/otp_screen.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'provider/provider.dart';

final formKey = GlobalKey<FormState>();

List myDate = [];
List myData = [];
List pinList = [];

double? mHeight;
double? mWidth;

TextEditingController phoneController = TextEditingController();
TextEditingController otpController = TextEditingController();

String? userName;

final GlobalKey<ScaffoldState> homeKey = GlobalKey<ScaffoldState>();

List<String> title = ['Water', 'Food', 'Workout', 'Sleep'];
List icon = [
  Icons.water_drop_outlined,
  Icons.restaurant_rounded,
  Icons.fitness_center_outlined,
  Icons.nightlight_outlined,
];
List iconColor = [blue, orange, red, violet];

List<String> foodTitle = ['Breakfast', 'Lunch', 'Dinner'];
List foodIcon = [
  Icons.lunch_dining,
  Icons.ramen_dining,
  Icons.dinner_dining,
];
List<String> workoutTitle = ['Warmup', 'Walking', 'Run'];
List workoutIcon = [
  Icons.sports_gymnastics,
  Icons.nordic_walking,
  Icons.run_circle_outlined,
];

//get OTP================================================================

Future<void> getOtp({context}) async {
  if (phoneController.text == '0000') {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', phoneController.text);
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(),
        ),
        (route) => false);
  } else {
    Fluttertoast.showToast(msg: 'Invalid credential', backgroundColor: red);
  }
}
//verify OTP=============================================================

Future<void> verifyOtp(context) async {
  String pinString = pinList.join();
  if (pinString == '0000') {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => false);

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    phoneController.clear();
  } else {
    Fluttertoast.showToast(msg: 'Invalid OTP', backgroundColor: red);
  }
}

selectTitle({index, context, daily = false}) {
 
  if (index == 0) {
    final water = daily
        ? myData[0].water
        : Provider.of<FitnessProvier>(context).waterCount;

    return "${water} glasses";
  } else if (index == 1) {
    final food =
        daily ? myData[0].food : Provider.of<FitnessProvier>(context).foodCount;

    return "${food} cals";
  } else if (index == 2) {
    final work = daily
        ? myData[0].workout
        : Provider.of<FitnessProvier>(context).workCount;

    return "${work} minutes";
  } else if (index == 3) {
    final sleep = daily
        ? myData[0].sleep
        : Provider.of<FitnessProvier>(context).sleepCount;

    return "${sleep} hours";
  }
}
