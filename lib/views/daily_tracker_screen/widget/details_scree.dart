import 'package:fit/controller/controller.dart';
import 'package:fit/views/home_screen/widget/item_tile.dart';
import 'package:fit/views/water_screen/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, this.date});
  final date;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: date),
      body: Column(children: [
        ListView.builder(
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (context, index) => ItemTile(
            index: index,
            daily: true,
            subTitle: selectTitle(
              index: index,
              context: context,
              daily: true,
            ),
          ),
        ),
      ]),
    );
  }
}


