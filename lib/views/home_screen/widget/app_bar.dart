
import 'package:fit/controller/controller.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  final Size preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: black,
        ),
        onPressed: () {
          homeKey.currentState!.openDrawer();
        },
      ),
      title: Text(
        'Track',
        style: TextStyle(color: black),
      ),
      backgroundColor: white,
    );
  }
}
