class StepHistory {
  final String title;
  final String duration;
  final String timeRange;
  final int steps;

  StepHistory({
    required this.title,
    required this.duration,
    required this.timeRange,
    required this.steps,
  });
}

class WeekHistory {
  final String date;
  final int steps;

  WeekHistory({required this.date, required this.steps});
}

class MonthHistory {
  final String weekRange;
  final int steps;

  MonthHistory({required this.weekRange, required this.steps});
}
