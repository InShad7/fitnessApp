import 'package:fit/controller/controller.dart';
import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/login_screen/login_screen.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void alertBox({context, delete = false, date}) {
  showModalBottomSheet(
    backgroundColor: grey2,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(18),
      ),
    ),
    context: context,
    builder: (context) => Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        kHeight,
        SizedBox(
          width: 400,
          height: 70,
          child: TextButton(
            onPressed: () async {
              if (delete) {
                Provider.of<FitnessProvier>(context, listen: false)
                    .deleteField('date', date, context);
                Navigator.pop(context);
              } else {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLoggedIn', false);
                phoneController.clear();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                    (route) => false);
                // Navigator.pop(context);
              }
            },
            child: Text(
              delete ? 'Delete' : 'Logout',
              style: TextStyle(color: teal, fontSize: 18),
            ),
          ),
        ),
        const Divider(indent: 60, endIndent: 60),
        SizedBox(
          height: 65,
          width: 400,
          child: TextButton(
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Text(
              'Cancel',
              style: TextStyle(color: red, fontSize: 18),
            ),
          ),
        ),
        kHeight,
      ],
    ),
  );
}
