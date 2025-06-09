class CompanyData {
  final String imagePath;
  final String heading;
  final String description;

  CompanyData({
    required this.imagePath,
    required this.heading,
    required this.description,
  });
}

class EmployeeReviews {
  final String username;
  final String profilePath;
  final String date;
  final double rating;
  final String review;

  EmployeeReviews({
    required this.username,
    required this.profilePath,
    required this.review,
    required this.date,
    required this.rating,
  });
}
