class PillReminder {
  final String name;
  final String time;
  final List<String> days;
  bool isReminderOn;

  PillReminder({
    required this.name,
    required this.time,
    required this.days,
    required this.isReminderOn,
  });
}
