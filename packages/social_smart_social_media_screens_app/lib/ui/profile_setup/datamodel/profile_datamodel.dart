import '../../../utils/app_assets.dart';

class ProfileStep {
  final String title;
  final String? description;
  final List<String>? options;
  final List<String>? genderImages;
  final bool hasButtonField;
  final bool hasInputField;
  final bool isProfile;
  final bool isCreateNewPin;

  ProfileStep({
    required this.title,
    this.description,
    this.options,
    this.hasInputField = false,
    this.hasButtonField = false,
    this.genderImages,
    this.isProfile = false,
    this.isCreateNewPin = false,
  });
}

final List<ProfileStep> onboardingSteps = [
  ProfileStep(
    title: "Choose Your Interest",
    description: "Choose your interests to get the best video recommendations.",
    options: [
      "Entertainment",
      "Gaming",
      "Art",
      "Animals",
      "Comedy",
      "Dance",
      "Beauty",
      "Music",
      "Food & Drink",
      "Sports",
      "DIY",
      "Science & Education",
      "Travel",
      "Family",
      "Anime & Movie",
      "Technology",
      "Outdoors",
      "Culture",
      "Health",
      "Comics",
    ],
  ),
  ProfileStep(
    title: "Tell Us About Yourself",
    description: "Choose your identity & help us find accurate content for you.",
    genderImages: [AppAssets.icMale, AppAssets.icFemale],
    options: ["Male", "Female"],
    hasButtonField: true,
  ),
  ProfileStep(
    title: "When is Your Birthday?",
    description: "Your birthday will not be shown to the public.",
    hasInputField: true,
  ),
  ProfileStep(
    title: "Fill Your Profile",
    isProfile: true,
  ),
  ProfileStep(
    title: "Create New PIN",
    isCreateNewPin: true,
  )
];
