import 'package:fit/controller/controller.dart';
import 'package:fit/controller/provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/app_bar.dart';
import 'widget/drawer.dart';
import 'widget/item_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    getName();
    Provider.of<FitnessProvier>(context, listen: false).getData();
    return Scaffold(
      key: homeKey,
      appBar: const CustomAppBar(),
      drawer: const NavigationDrawers(),
      body: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            itemCount: 4,
            itemBuilder: (context, index) => ItemTile(
              index: index,
              subTitle: selectTitle(
                index: index,
                context: context,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
