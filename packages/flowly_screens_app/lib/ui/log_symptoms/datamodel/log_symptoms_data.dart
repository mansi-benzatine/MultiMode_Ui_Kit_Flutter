class TrackerTag {
  final String id;
  final String title;
  final String icon;
  bool isSelected;

  TrackerTag({
    required this.id,
    required this.title,
    required this.icon,
    this.isSelected = false,
  });
}

class DailyHealthLog {
  DateTime date;
  String? menstrualFlow;
  List<String> mood = [];
  List<String> symptoms = [];
  List<String> discharge = [];
  List<PillReminder> pills;
  double? weight;
  String? note;

  DailyHealthLog({
    required this.date,
    this.menstrualFlow,
    this.mood = const [],
    this.symptoms = const [],
    this.discharge = const [],
    this.pills = const [],
    this.weight,
    this.note,
  });
}

class PillReminder {
  final String id;
  final String title;
  final DateTime time;

  PillReminder({
    required this.id,
    required this.title,
    required this.time,
  });
}

class PillLog {
  final String id;
  final String medicineName;
  final DateTime time;
  final int numberOfIntakes;
  final String shapeId;
  final bool reminder;

  PillLog({
    required this.id,
    required this.medicineName,
    required this.time,
    required this.numberOfIntakes,
    required this.shapeId,
    required this.reminder,
  });
}

class MedicineShape {
  final String id;
  final String icon;
  bool isSelected;

  MedicineShape({
    required this.id,
    required this.icon,
    this.isSelected = false,
  });
}
