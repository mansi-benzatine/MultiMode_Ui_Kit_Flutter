class DayHistory {
  final String date;
  final int steps;
  final String duration; // format HH:MM
  final int kcal;
  final double km;

  DayHistory({
    required this.date,
    required this.steps,
    required this.duration,
    required this.kcal,
    required this.km,
  });
}

class WeekHistory {
  final String weekRange;
  final int totalSteps;
  final List<DayHistory> days;

  WeekHistory({
    required this.weekRange,
    required this.totalSteps,
    required this.days,
  });
}
