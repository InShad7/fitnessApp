import 'package:fit/controller/controller.dart';
import 'package:fit/controller/db_fun/db_funs.dart';
import 'package:fit/model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FitnessProvier extends ChangeNotifier {
//food============================================================
  int foodCount = 0;

  void incrementFoodCount() {
    if (foodCount < 1500) {
      foodCount += 500;
      notifyListeners();
    }
  }

  void decrementFoodCount() {
    if (foodCount > 0) {
      foodCount -= 500;
      notifyListeners();
    }
  }

  void deleteFoodCount() {
    foodCount = 0;
  }

//water============================================================

  int waterCount = 0;

  void incrementWaterCount() {
    if (waterCount < 9) {
      waterCount++;
      notifyListeners();
      print(waterCount);
    }
  }

  void decrementWaterCount() {
    if (waterCount > 0) {
      waterCount--;
      notifyListeners();
      print(waterCount);
    }
  }

  void deleteWaterCount() {
    waterCount = 0;
  }

  //workout================================================================

  int workCount = 0;

  void incrementWorkCount() {
    if (workCount < 60) {
      workCount++;
      notifyListeners();
      print(workCount);
    }
  }

  void decrementWorkCount() {
    if (workCount > 0) {
      workCount--;
      notifyListeners();
      print(workCount);
    }
  }

  void deleteWorkCount() {
    workCount = 0;
  }

  //sleeep================================================================

  int sleepCount = 0;

  void incrementSleepCount() {
    if (sleepCount < 8) {
      sleepCount++;
      notifyListeners();
      print(sleepCount);
    }
  }

  void decrementSleepCount() {
    if (sleepCount > 0) {
      sleepCount--;
      notifyListeners();
      print(sleepCount);
    }
  }

  void deleteSleepCount() {
    sleepCount = 0;
  }

//update =================================================================

  Future<void> updateFitness() async {
    final _db = await db;

    DateTime currentDate = DateTime.now();
    String formattedDate = DateFormat('MMMM d y').format(currentDate);

    print(formattedDate);

    // check if already exists for the current date========================
    List<Map<String, dynamic>> data = await _db.query(
      'fit',
      where: 'date = ?',
      whereArgs: [formattedDate.toString()],
    );

    if (data.isNotEmpty) {
      FitnessModel fitnessModel = FitnessModel(
        id: data[0]['id'],
        date: formattedDate.toString(),
        water: waterCount,
        food: foodCount,
        sleep: sleepCount,
        workout: workCount,
      );

      await _db.update(
        'fit',
        fitnessModel.toMap(),
        where: 'id = ?',
        whereArgs: [fitnessModel.id],
      );
    } else {
//get last id used=======================================================
      int lastUsedId = 0;

      List<Map<String, dynamic>> result =
          await _db.rawQuery('SELECT MAX(id) as lastId FROM fit');
      lastUsedId = result[0]['lastId'] ?? 0;

      int newId = lastUsedId + 1;
      lastUsedId = newId;

//update model =======================
      FitnessModel fitnessModel = FitnessModel(
        id: newId,
        date: formattedDate.toString(),
        water: waterCount,
        food: foodCount,
        sleep: sleepCount,
        workout: workCount,
      );

      await _db.insert('fit', fitnessModel.toMap());
    }
    getData();
  }

//get data===========================================================

  Future<void> getData() async {
    final List<Map<String, dynamic>> data =
        await db.rawQuery('SELECT * FROM fit ORDER BY date DESC');

    if (data.isNotEmpty) {
      FitnessModel fitnessModel = FitnessModel.fromMap(data[0]);
      waterCount = fitnessModel.water ?? 0;
      foodCount = fitnessModel.food ?? 0;
      sleepCount = fitnessModel.sleep ?? 0;
      workCount = fitnessModel.workout ?? 0;
    } else {
      waterCount = 0;
      foodCount = 0;
      sleepCount = 0;
      workCount = 0;
    }

    myDate.clear();
    myDate = data.map((entry) => entry['date'] as String).toList();

    print(myDate);
    notifyListeners();
  }

  Future<void> getDataByDate(selectedDate) async {
    final List<Map<String, dynamic>> data = await db.rawQuery(
      'SELECT * FROM fit WHERE date = ?',
      [selectedDate],
    );

    if (data.isNotEmpty) {
      myData = data.map((entry) => FitnessModel.fromMap(entry)).toList();
      print('mydata::$myData');
    } else {
      myData.clear();
    }

    notifyListeners();
  }
//delete field by date=========================================================

  Future<void> deleteField(String fieldName, dynamic value, context) async {
    await db.rawDelete(
      'DELETE FROM fit WHERE $fieldName = ?',
      [value],
    );

    getData();
    notifyListeners();
  }
}
