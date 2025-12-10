class Vaccine {
  final String name;
  final String completedDate;
  final VaccineStatus status;

  Vaccine({
    required this.name,
    required this.completedDate,
    required this.status,
  });
}

enum VaccineStatus { completed, missed, upcoming }

class VaccineGroup {
  final String title;
  final List<Vaccine> vaccines;

  VaccineGroup({
    required this.title,
    required this.vaccines,
  });
}
