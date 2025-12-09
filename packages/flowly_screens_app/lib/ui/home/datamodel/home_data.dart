import 'dart:ui';

enum SymptomType {
  emoji,
  asset,
  counter,
}

class SymptomModel {
  final SymptomType type;
  final String value;

  SymptomModel({
    required this.type,
    required this.value,
  });
}

class CyclePhaseModel {
  final String iconName;
  final String date;
  final String phase;
  final Color color;
  final Color borderColor;

  CyclePhaseModel({
    required this.iconName,
    required this.date,
    required this.phase,
    required this.color,
    required this.borderColor,
  });
}

enum ReminderNotesType {
  reminder,
  notes,
}

class ReminderNoteModel {
  final String title;
  final String subTitle;
  final ReminderNotesType type;
  final String? time;
  final String iconName;

  ReminderNoteModel({
    required this.title,
    required this.subTitle,
    required this.type,
    this.time,
    required this.iconName,
  });
}

class SuggestedForYouModel {
  final String imageName;
  final String title;
  final String subTitle;
  final bool isVideo;
  final String? duration;

  SuggestedForYouModel({
    required this.title,
    required this.imageName,
    required this.subTitle,
    this.isVideo = false,
    this.duration,
  });
}
