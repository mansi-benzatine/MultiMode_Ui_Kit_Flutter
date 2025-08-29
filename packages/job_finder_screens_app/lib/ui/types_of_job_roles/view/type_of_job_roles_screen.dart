import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../types_of_job_type/view/types_of_job_type_screen.dart';
import '../model/type_job_roles_data.dart';

class TypeJobRolesScreen extends StatefulWidget {
  const TypeJobRolesScreen({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const TypeJobRolesScreen());
  }

  @override
  State<TypeJobRolesScreen> createState() => _TypeJobRolesScreenState();
}

class _TypeJobRolesScreenState extends State<TypeJobRolesScreen> implements TopBarClickListener {
  List<JobRoleTypesModel> jobRolesList = [];
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

  fillData() {
    jobRolesList = [
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesDesignSelected,
        unselectedImagePath: AppAssets.icRolesDesignUnSelected,
        jobRole: Languages.of(context).txtDesign,
        totalJobs: "140",
        isSelected: true,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesFinanceSelected,
        unselectedImagePath: AppAssets.icRolesFinanceUnSelected,
        jobRole: Languages.of(context).txtFinance,
        totalJobs: "250",
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesEducationSelected,
        unselectedImagePath: AppAssets.icRolesEducationUnSelected,
        jobRole: Languages.of(context).txtEducation,
        totalJobs: "120",
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesRestaurantSelected,
        unselectedImagePath: AppAssets.icRolesRestaurantUnSelected,
        jobRole: Languages.of(context).txtRestaurant,
        totalJobs: "85",
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesHealthSelected,
        unselectedImagePath: AppAssets.icRolesHealthUnSelected,
        jobRole: Languages.of(context).txtHealth,
        totalJobs: "235",
        isSelected: false,
      ),
      JobRoleTypesModel(
        selectedImagePath: AppAssets.icRolesProgrammerSelected,
        unselectedImagePath: AppAssets.icRolesProgrammerUnSelected,
        jobRole: Languages.of(context).txtProgrammer,
        totalJobs: "412",
        isSelected: true,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreenWhite,
      body: Column(
        children: [
          IgnorePointer(
            ignoring: true,
            child: TopBar(
              this,
              title: "",
              iconColor: CustomAppColor.of(context).bgDetailsCard,
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const _TitleAndDescriptionView(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 22.setHeight, vertical: 30.setHeight),
                      child: SelectJobRoleAndTypes(jobRolesList: jobRolesList),
                    ),
                  ),
                ),
                const Align(
                  alignment: Alignment.bottomCenter,
                  child: IgnorePointer(
                    ignoring: true,
                    child: _ContinueButtonView(),
                  ),
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
                TextSpan(text: "${Languages.of(context).txtWhatTypeOfJobRolesYour} "),
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
            text: Languages.of(context).txtWhatTypeOfJobRolesYourLookingForDesc,
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
        childAspectRatio: 0.85,
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
            padding: EdgeInsets.symmetric(vertical: 20.setHeight),
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
                CommonText(
                  text: "${jobRole.totalJobs} Jobs",
                  textColor: jobRole.isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).grey,
                  fontWeight: FontWeight.w400,
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
            Navigator.push(context, TypesOfJobTypeScreen.route());
          },
        ),
      ),
    );
  }
}
