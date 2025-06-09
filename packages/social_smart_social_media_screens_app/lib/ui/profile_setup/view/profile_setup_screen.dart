import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:social_smart_social_media_screens_app_package/utils/utils.dart';

import '../../../dialogs/alert/common_dialog.dart';
import '../../../localization/language/languages.dart';
import '../../../ui/profile_setup/datamodel/profile_datamodel.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/preference.dart';
import '../../../utils/service_locator.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text/gradiant_text.dart';
import '../../../widgets/textfield/common_digit_textformfield.dart';
import '../../../widgets/textfield/common_textformfield.dart';

class ProfileSetUpScreen extends StatefulWidget {
  final int initialIndex;

  const ProfileSetUpScreen({super.key, required this.initialIndex});
  static Route route({required int initialIndex}) {
    return MaterialPageRoute(
      builder: (_) => ProfileSetUpScreen(initialIndex: initialIndex),
    );
  }

  @override
  State<ProfileSetUpScreen> createState() => _ProfileSetUpScreenState();
}

class _ProfileSetUpScreenState extends State<ProfileSetUpScreen> {
  late PageController pageController;
  int currentIndex = 0;
  List<int> selectedIndices = [
    0, // Entertainment
    4, // Comedy
    6, // Beauty
    9, // Sports
    11, // Science & Education
    14, // Anime & Movie
    16, //Outdoors
    17, // Culture
  ];
  int selectedGenderIndex = 0;
  DateTime selectedDate = DateTime(1991, 12, 6);
  final List<TextEditingController> controllers = List.generate(4, (_) => TextEditingController());
  final List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  @override
  void dispose() {
    for (final c in controllers) {
      c.dispose();
    }
    for (final f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController(
      initialPage: widget.initialIndex,
      viewportFraction: 1.0,
      keepPage: true,
    );
    currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IgnorePointer(
          ignoring: true,
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        centerTitle: false,
        titleSpacing: 0,
        backgroundColor: CustomAppColor.of(context).bgScaffold,
        title: CommonText(
          text: onboardingSteps[currentIndex].title,
          fontWeight: FontWeight.w700,
          fontSize: AppSizes.setFontSize(20),
        ),
      ),
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemCount: onboardingSteps.length,
        itemBuilder: (context, index) {
          final step = onboardingSteps[index];
          return _buildOnboardingStep(step, context);
        },
      ),
    );
  }

  Widget _buildOnboardingStep(ProfileStep step, BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                if (step.description != null)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16), horizontal: AppSizes.setWidth(20)),
                    child: CommonText(
                      text: step.description!,
                      textAlign: TextAlign.start,
                      fontWeight: FontWeight.w500,
                      fontSize: AppSizes.setFontSize(16),
                    ),
                  ),
                if (step.options != null && !step.hasButtonField) _buildOptions(step),
                if (step.hasButtonField) _buildGenderSelection(step),
                if (step.hasInputField) _buildDateFields(step),
                if (step.isProfile) _buildInputFields(step),
                if (step.isCreateNewPin) _buildNewPin(step),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(20)),
              child: _buildBottomButtons(context, step),
            ),
          ),
        ],
      ),
    );
  }

  _buildOptions(ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(12)),
      child: Wrap(
        spacing: AppSizes.setWidth(12),
        runSpacing: 15.0,
        children: step.options!.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;

          return GestureDetector(
            onTap: () {
              setState(() {
                if (selectedIndices.contains(index)) {
                  selectedIndices.remove(index);
                } else {
                  selectedIndices.add(index);
                }
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20), vertical: AppSizes.setHeight(6)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                gradient: selectedIndices.contains(index)
                    ? LinearGradient(
                        colors: [CustomAppColor.of(context).bgGradiant1, CustomAppColor.of(context).bgGradiant2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                border: Border.all(
                  color: selectedIndices.contains(index) ? Colors.transparent : CustomAppColor.of(context).bgGradiant1,
                  width: 1.8,
                ),
              ),
              child: selectedIndices.contains(index)
                  ? CommonText(
                      text: option,
                      textColor: CustomAppColor.of(context).white,
                      fontWeight: FontWeight.w700,
                      fontSize: AppSizes.setFontSize(14),
                    )
                  : GradientText(
                      child: CommonText(
                        text: option,
                        fontSize: AppSizes.setFontSize(14),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildGenderSelection(ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(50)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: step.options!.asMap().entries.map((entry) {
          int index = entry.key;
          String option = entry.value;
          String imagePath = step.genderImages![index];

          return GestureDetector(
            onTap: () {
              setState(() {
                selectedGenderIndex = (selectedGenderIndex == index ? null : index)!;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(16)),
              child: Container(
                width: AppSizes.setWidth(160),
                height: AppSizes.setHeight(160),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: selectedGenderIndex == index ? null : CustomAppColor.of(context).bgContainer,
                  gradient: selectedGenderIndex == index
                      ? LinearGradient(
                          colors: [CustomAppColor.of(context).bgGradiant1, CustomAppColor.of(context).bgGradiant2],
                        )
                      : null,
                  border: Border.all(
                    color: CustomAppColor.of(context).transparent,
                    width: 2,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagePath, height: AppSizes.setHeight(56), width: AppSizes.setWidth(80)),
                    const SizedBox(height: 8),
                    CommonText(
                      text: option,
                      textColor: CustomAppColor.of(context).white,
                      fontSize: AppSizes.setFontSize(18),
                      fontWeight: FontWeight.w700,
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  _buildDateFields(ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.setHeight(50)),
            child: Image.asset(
              AppAssets.imgBirthday,
              height: AppSizes.setHeight(200),
              width: AppSizes.setWidth(200),
            ),
          ),
          SizedBox(height: AppSizes.setHeight(20)),
          Container(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(25)),
            height: AppSizes.setHeight(50),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(25), color: CustomAppColor.of(context).bgTextFormField),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonText(
                  text: "${selectedDate.month}/${selectedDate.day}/${selectedDate.year}",
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(18),
                ),
                Image.asset(
                  AppAssets.icCalender,
                  color: CustomAppColor.of(context).icBlack,
                  width: AppSizes.setWidth(18),
                )
              ],
            ),
          ),
          SizedBox(height: AppSizes.setHeight(20)),
          DatePickerWidget(
            looping: true,
            firstDate: DateTime(1900),
            initialDate: selectedDate,
            dateFormat: "MMM/dd/yyyy",
            onChange: (DateTime newDate, _) {
              setState(() {
                selectedDate = newDate;
              });
            },
            pickerTheme: DateTimePickerTheme(
              backgroundColor: CustomAppColor.of(context).transparent,
              itemTextStyle: TextStyle(
                color: CustomAppColor.of(context).txtBlack,
                fontSize: AppSizes.setFontSize(24),
                fontFamily: Constant.fontFamilyUrbanist,
                fontWeight: FontWeight.w600,
              ),
              dividerColor: CustomAppColor.of(context).bgDivider.withOpacityPercent(0.1),
              dividerThickness: 1.5,
              diameterRatio: 6,
              dividerSpacing: 15,
              itemHeight: AppSizes.setHeight(36),
              squeeze: 0.7,
              pickerHeight: 200,
            ),
          ),
        ],
      ),
    );
  }

  _buildInputFields(ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(25)),
            child: Stack(
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage(
                    AppAssets.imgProfile,
                  ),
                ),
                Positioned(
                  bottom: AppSizes.setHeight(0),
                  right: AppSizes.setWidth(0),
                  left: AppSizes.setWidth(100),
                  child: GestureDetector(
                    onTap: () {},
                    child: Image.asset(
                      AppAssets.icProfileEdit,
                      scale: 3.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
          CommonTextFormField(
            hintText: Languages.of(context).enterName,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
            child: CommonTextFormField(
              hintText: Languages.of(context).enterSurname,
            ),
          ),
          CommonTextFormField(
            hintText: Languages.of(context).enterEmail,
            suffixIcon: Image.asset(
              AppAssets.icMail,
              color: CustomAppColor.of(context).icBlack,
              scale: 5,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(15)),
            child: CommonTextFormField(
              isPhoneNumberField: true,
              hintText: Languages.of(context).enterPhoneNumber,
              onChanged: (phone) {},
            ),
          ),
          CommonTextFormField(
            hintText: Languages.of(context).enterAddress,
            suffixIcon: Image.asset(
              AppAssets.icLocation,
              color: CustomAppColor.of(context).icBlack,
              scale: 4,
            ),
          ),
        ],
      ),
    );
  }

  _buildNewPin(ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.setHeight(120)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(25)),
            child: CommonText(
              text: Languages.of(context).addAPinNumber,
              fontSize: AppSizes.setFontSize(16),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: AppSizes.setHeight(60)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(20)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: AppSizes.setWidth(75),
                  height: AppSizes.setHeight(60),
                  child: SingleDigitTextField(
                    isObscure: true,
                    controller: controllers[index],
                    currentFocus: focusNodes[index],
                    nextFocus: index < 3 ? focusNodes[index + 1] : null,
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }

  _buildBottomButtons(BuildContext context, ProfileStep step) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSizes.setWidth(0), vertical: AppSizes.setHeight(20)),
      child: Row(
        children: [
          if (onboardingSteps.indexOf(step) != onboardingSteps.length - 1)
            Flexible(
              child: CommonButton(
                useSimpleStyle: true,
                isShadowButton: false,
                child: CommonText(
                  textColor: CustomAppColor.of(context).txtPurple,
                  text: Languages.of(context).skip,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(16),
                ),
              ),
            ),
          SizedBox(width: AppSizes.setWidth(15)),
          Expanded(
            child: IgnorePointer(
              ignoring: currentIndex == 4 ? false : true,
              child: CommonButton(
                isShadowButton: true,
                onTap: () {
                  if (currentIndex < onboardingSteps.length - 1) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    showCongratulationDialog(context);
                  }
                },
                child: CommonText(
                  text: Languages.of(context).continu,
                  textColor: CustomAppColor.of(context).white,
                  fontWeight: FontWeight.w700,
                  fontSize: AppSizes.setFontSize(16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showCongratulationDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (_) {
        return CommonDialog(
          titleText: CommonText(
            text: Languages.of(context).congratulations,
            fontWeight: FontWeight.bold,
            fontSize: AppSizes.setFontSize(24),
            textColor: CustomAppColor.of(context).txtPurple,
          ),
          descriptionText: CommonText(
            text: Languages.of(context).yourAccountIsReadyToUse,
            fontSize: AppSizes.setFontSize(14),
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
          ),
          icon: Image.asset(
            AppAssets.imgAccountCreateSuccessfully,
            height: AppSizes.setHeight(180),
          ),
          showLoader: true,
        );
      },
    );

    Future.delayed(const Duration(seconds: 2), () {
      getIt.get<LocalStorageService>().setBool(LocalStorageService.isWelcomeDone, true);

      if (context.mounted) {
        Navigator.of(context, rootNavigator: true).pop();
        /* Navigator.pushAndRemoveUntil(
          context,
          HomeScreen.route(),
          (Route<dynamic> route) => false,
        );*/
      }
    });
  }
}
