import 'package:fit/controller/controller.dart';
import 'package:fit/controller/provider/provider.dart';
import 'package:fit/views/daily_tracker_screen/widget/details_scree.dart';
import 'package:fit/views/home_screen/widget/alert.dart';
import 'package:fit/views/utils/utils.dart';
import 'package:fit/views/water_screen/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyTrackerScreen extends StatelessWidget {
  const DailyTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<FitnessProvier>(context, listen: false).getData();
    return Scaffold(
      appBar: const CustomAppBar2(title: 'Daily tracker'),
      body: Consumer<FitnessProvier>(
        builder: (context, value, child) {
          return Column(
            mainAxisAlignment: myDate.isEmpty
                ? MainAxisAlignment.center
                : MainAxisAlignment.start,
            children: [
              myDate.isNotEmpty
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: myDate.length,
                      itemBuilder: (context, index) {
                        final date = myDate[index];
                        return Container(
                          margin: const EdgeInsets.only(
                              left: 15, right: 15, top: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: white,
                          ),
                          child: ListTile(
                            title: Text(
                              date,
                            ),
                            trailing: IconButton(
                              onPressed: () {
                                alertBox(
                                    context: context, date: date, delete: true);
                              },
                              icon: Icon(
                                Icons.delete_outline_rounded,
                                color: red,
                              ),
                            ),
                            onTap: () {
                              value.getDataByDate(date);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreen(date: date),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    )
                  : Image.asset('assets/nodata.jpg')
            ],
          );
        },
      ),
    );
  }
}
