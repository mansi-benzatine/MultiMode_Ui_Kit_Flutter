class ProfileDetails {
  final String name;
  final String designation;
  final int jobsApplied;
  final String memberSince;
  final int interviews;
  final String aboutMe;
  final String location;
  final String mobileNumber;
  final String mail;
  final String dob;
  final List<ExperienceData> workExperience;
  final List<EducationQualificationData> educationQualification;
  final List<String> technicalSkill;
  final List<String> languages;

  ProfileDetails({
    required this.name,
    required this.aboutMe,
    required this.designation,
    required this.jobsApplied,
    required this.memberSince,
    required this.interviews,
    required this.dob,
    required this.educationQualification,
    required this.languages,
    required this.location,
    required this.mail,
    required this.mobileNumber,
    required this.technicalSkill,
    required this.workExperience,
  });
}

class ExperienceData {
  final String previousExperience;
  final String previousCompany;
  final String previousDuration;

  ExperienceData({
    required this.previousCompany,
    required this.previousDuration,
    required this.previousExperience,
  });
}

class EducationQualificationData {
  final String degreeName;
  final String universityName;
  final String duration;

  EducationQualificationData({
    required this.degreeName,
    required this.universityName,
    required this.duration,
  });
}
