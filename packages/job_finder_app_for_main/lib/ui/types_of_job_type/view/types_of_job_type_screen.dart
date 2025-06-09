import 'package:flutter/material.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';
import '../../confirm_new_account/view/confirm_new_account_screen.dart';
import '../../types_of_job_roles/model/type_job_roles_data.dart';

class TypesOfJobTypeScreen extends StatefulWidget {
  const TypesOfJobTypeScreen({super.key});
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const TypesOfJobTypeScreen());
  }

  @override
  State<TypesOfJobTypeScreen> createState() => _TypesOfJobTypeScreenState();
}

class _TypesOfJobTypeScreenState extends State<TypesOfJobTypeScreen> implements TopBarClickListener {
  List<JobRoleTypesModel> jobTypesList = [];
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

  fillData() {
    jobTypesList = [
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icTypeTimeSelected,
        unselectedImagePath: AppAssets.icTypeTimeUnSelected,
        jobRole: Languages.of(context).txtFullTime,
        isSelected: true,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icTypePartTimeSelected,
        unselectedImagePath: AppAssets.icTypePartTimeUnSelected,
        jobRole: Languages.of(context).txtPartTime,
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icTypeContractSelected,
        unselectedImagePath: AppAssets.icTypeContractUnSelected,
        jobRole: Languages.of(context).txtContract,
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icTypeInternshipSelected,
        unselectedImagePath: AppAssets.icTypeInternshipUnSelected,
        jobRole: Languages.of(context).txtInternship,
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icTypeFreelancerSelected,
        unselectedImagePath: AppAssets.icTypeFreelancerUnSelected,
        jobRole: Languages.of(context).txtFreelance,
        isSelected: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          TopBar(
            this,
            title: "",
            iconColor: CustomAppColor.of(context).bgDetailsCard,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _TitleAndDescriptionView(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setHeight, vertical: 30.setHeight),
                      child: SelectJobRoleAndTypes(jobRolesList: jobTypesList),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: _ContinueButtonView(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}

class _TitleAndDescriptionView extends StatelessWidget {
  const _TitleAndDescriptionView();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 24.setWidth, right: 24.setWidth, top: 20.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 30.setFontSize,
                fontWeight: FontWeight.w700,
                color: CustomAppColor.of(context).txtBlack,
              ),
              children: [
                TextSpan(text: "${Languages.of(context).txtWhatTypeOfJobTypeYour} "),
                TextSpan(
                  text: "${Languages.of(context).txtLookingFor}?",
                  style: TextStyle(
                    color: CustomAppColor.of(context).icPrimary,
                  ), // Highlighted color
                ),
              ],
            ),
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtWhatTypeOfJobTypeYourLookingForDesc,
            fontWeight: FontWeight.w500,
            fontSize: 15.setFontSize,
            textColor: CustomAppColor.of(context).txtGreyWhite,
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class SelectJobRoleAndTypes extends StatefulWidget {
  final List<JobRoleTypesModel> jobRolesList;

  const SelectJobRoleAndTypes({super.key, required this.jobRolesList});

  @override
  SelectJobRoleAndTypesState createState() => SelectJobRoleAndTypesState();
}

class SelectJobRoleAndTypesState extends State<SelectJobRoleAndTypes> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.9,
      ),
      itemCount: widget.jobRolesList.length,
      itemBuilder: (context, index) {
        final jobRole = widget.jobRolesList[index];

        return GestureDetector(
          onTap: () {
            setState(() {
              jobRole.isSelected = !jobRole.isSelected;
            });
          },
          child: AnimatedContainer(
            height: 180.setHeight,
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(vertical: 25.setHeight),
            decoration: BoxDecoration(
              color: jobRole.isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).bgWhiteSecondary,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColor(context).black.withOpacityPercent(0.05),
                  blurRadius: 9,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  jobRole.isSelected ? jobRole.selectedImagePath : jobRole.unselectedImagePath,
                  width: 67.setWidth,
                  height: 67.setHeight,
                ),
                SizedBox(height: 18.setHeight),
                CommonText(
                  text: jobRole.jobRole ?? '',
                  textColor: jobRole.isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtBlack,
                  fontWeight: FontWeight.w700,
                ),
                SizedBox(height: 11.setHeight),
                Visibility(
                  visible: jobRole.totalJobs != null,
                  child: CommonText(
                    text: "${jobRole.totalJobs} Jobs",
                    textColor: jobRole.isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).grey,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _ContinueButtonView extends StatelessWidget {
  const _ContinueButtonView();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CustomAppColor.of(context).bgScreenWhite,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 20,
            spreadRadius: 0,
            color: CustomAppColor.of(context).black.withOpacityPercent(.08),
          ),
        ],
      ),
      padding: EdgeInsets.only(left: 25.setWidth, right: 25.setWidth, bottom: 10.setHeight, top: 15.setHeight),
      child: SafeArea(
        top: false,
        child: CommonButton(
          text: Languages.of(context).txtContinue,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
          onTap: () {
            Navigator.push(context, ConfirmNewAccountScreen.route());
          },
        ),
      ),
    );
  }
}
