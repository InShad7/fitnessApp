import 'package:fit/controller/controller.dart';
import 'package:fit/views/home_screen/home_screen.dart';
import 'package:fit/views/login_screen/login_screen.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isloggedIn = false;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    mWidth = MediaQuery.of(context).size.width;
    mHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: mHeight,
            width: mWidth,
            child: Image.asset(
              'assets/fit.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: 30,
            left: mWidth! / 5.5,
            child: Text(
              'Born to be Fit',
              style: TextStyle(
                color: white,
                fontSize: mHeight! / 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  void checkLoggedIn() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    bool loggedIn = sharedPrefs.getBool('isLoggedIn') ?? false;
    setState(() {
      isloggedIn = loggedIn;
    });
    if (isloggedIn == true) {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      await Future.delayed(
        const Duration(seconds: 1),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    }
  }
}
