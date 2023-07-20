import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomAppBar2 extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar2({super.key, this.title});

  final Size preferredSize = const Size.fromHeight(60.0);
  final title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
      title: Text(
        title,
        style: TextStyle(color: black),
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: black),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
