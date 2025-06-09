class JobRoleTypesModel {
  final String selectedImagePath;
  final String unselectedImagePath;
  final String? jobRole;
  final String? totalJobs;
  final String? jobType;
  bool isSelected;

  JobRoleTypesModel({
    required this.selectedImagePath,
    required this.unselectedImagePath,
    this.jobRole,
    this.totalJobs,
    this.jobType,
    required this.isSelected,
  });
}
