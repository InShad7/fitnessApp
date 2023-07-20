class FitnessModel {
  int? id;
  String? date;
  int? water;
  int? food;
  int? workout;
  int? sleep;

  FitnessModel({
    required this.id,
    required this.date,
    required this.water,
    required this.food,
    required this.sleep,
    required this.workout,
  });

  factory FitnessModel.fromMap(Map<String, dynamic> map) {
    return FitnessModel(
      id: map['id'],
      date: map['date'],
      water: map['water'],
      food: map['food'],
      sleep: map['sleep'],
      workout: map['workout'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'water': water,
      'food': food,
      'sleep': sleep,
      'workout': workout,
    };
  }
}
