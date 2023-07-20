import 'package:fit/controller/controller.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:flutter/material.dart';

class MessageBar extends StatelessWidget {
  const MessageBar({
    super.key, this.title,
  });
  final title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: mHeight! / 15,
      color: waterBlue,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: grey1,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
