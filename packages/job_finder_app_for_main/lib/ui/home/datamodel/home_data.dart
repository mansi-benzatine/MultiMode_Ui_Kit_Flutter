class JobDetailsModel {
  final String jobName;
  final String jobProfileImagePath;
  final String? companyName;
  final List<String> jobType;
  final String salary;
  final String city;
  final String? state;
  final bool? isSaved;
  final String? applicationStatus;

  JobDetailsModel({
    required this.jobName,
    required this.jobProfileImagePath,
    this.companyName,
    required this.jobType,
    required this.salary,
    required this.city,
    this.state,
    this.isSaved,
    this.applicationStatus,
  });
}
