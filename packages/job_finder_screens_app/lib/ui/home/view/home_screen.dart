import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/app_assets.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/button/common_button.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../localization/language/languages.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../filter_options/view/filter_options_screen.dart';
import '../../job_details/view/job_details_screen.dart';
import '../../search_job/view/search_job_screen.dart';
import '../../types_of_job_roles/model/type_job_roles_data.dart';
import '../datamodel/home_data.dart';

class HomeScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomeScreen());
  }

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<JobRoleTypesModel> jobTypesList = [];
  List<JobDetailsModel> suggestedJobsList = [];
  List<JobDetailsModel> recentJobsList = [];
  ValueNotifier<bool> isSelected = ValueNotifier<bool>(true);

  void fillData() {
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
        isSelected: false, // Changed to false for consistency
      ),
    ];

    suggestedJobsList = [
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarKickstarter,
        jobName: "Product Designer",
        companyName: "Kickstarter",
        jobType: ["IT", "Full-Time", "Junior"],
        salary: "180,00",
        city: "California,",
        state: "USA",
        isSaved: false,
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarAcademia,
        jobName: "UI Designer",
        companyName: "Google",
        jobType: ["Design", "Full-Time", "Junior"],
        salary: "160,00",
        city: "Texas",
        state: "",
        isSaved: true,
      )
    ];
    recentJobsList = [
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarTwitch,
        jobName: "UI/UX Designer",
        jobType: ["Full-Time"],
        salary: "4500",
        city: "United States",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarVkontakte,
        jobName: "Web Designer",
        jobType: ["Part-Time"],
        salary: "3200",
        city: "New York City",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarMeetup,
        jobName: "Visual Designer",
        companyName: "Google",
        jobType: ["Freelance"],
        salary: "6400",
        city: "Los Angels",
        state: " US",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarXing,
        jobName: "Full Stack Designer",
        jobType: ["Full-Time"],
        salary: "9600",
        city: "California",
        state: " USA",
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).txtSecondary,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const IgnorePointer(ignoring: true, child: SearchAndFilterView()),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 15.setHeight),
                    const FindJobCardWidget(),
                    SizedBox(height: 30.setHeight),
                    BrowseByCategoryView(jobRolesList: jobTypesList),
                    SizedBox(height: 30.setHeight),
                    IgnorePointer(ignoring: true, child: SuggestedJobsView(jobSuggestedList: suggestedJobsList)),
                    SizedBox(height: 30.setHeight),
                    RecentJobsView(recentJobList: recentJobsList)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SearchAndFilterView extends StatelessWidget {
  const SearchAndFilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).secondary,
            border: Border(
              top: BorderSide(
                width: 0,
                color: CustomAppColor.of(context).secondary,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: 16.setWidth),
                  child: CommonTextFormFieldWithPrefix(
                    onTap: () => Navigator.push(context, SearchJobScreen.route(isFromNoResultFound: false, isFromSearchJob: false, isFromSearchResult: false)),
                    controller: TextEditingController(),
                    hintText: Languages.of(context).txtSearchAJobOrPosition,
                    prefixIcon: AppAssets.icSearch,
                    prefixIconColor: CustomAppColor.of(context).icGrey,
                    fillColor: CustomAppColor.of(context).bgTextFormFieldGreySecondary,
                    hintTextFontSize: 14.setFontSize,
                    hintFontWeight: FontWeight.w400,
                    hintWordSpacing: 0.1,
                    borderColor: CustomAppColor.of(context).transparent,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, FilterOptionsScreen.route()),
                child: Container(
                  width: 52.setWidth,
                  height: 52.setHeight,
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 12.setWidth),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomAppColor.of(context).bgDetailsCard,
                  ),
                  child: Image.asset(
                    AppAssets.icFilter,
                    height: 24.setHeight,
                    width: 24.setWidth,
                    color: CustomAppColor.of(context).icWhiteGrey,
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class FindJobCardWidget extends StatelessWidget {
  const FindJobCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 180.setHeight,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 12.setWidth),
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).icPrimary,
              borderRadius: BorderRadius.circular(30),
              image: const DecorationImage(image: AssetImage(AppAssets.imgCardBackground), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CommonText(
                  text: Languages.of(context).txtSeeHowYouCanFindAJob,
                  fontWeight: FontWeight.w500,
                  fontSize: 18.setFontSize,
                  textAlign: TextAlign.start,
                  textColor: CustomAppColor.of(context).white,
                ),
                const SizedBox(height: 12),
                CommonButton(
                  alignment: Alignment.bottomLeft,
                  text: Languages.of(context).txtReadMore,
                  buttonTextSize: 14.setFontSize,
                  buttonTextWeight: FontWeight.w500,
                  height: 34.setHeight,
                  width: 100.setWidth,
                  buttonTextColor: CustomAppColor.of(context).white,
                  buttonColor: CustomAppColor.of(context).bgContainerPrimary,
                ),
              ],
            ),
          ),
          Positioned(
            right: -20.setWidth,
            bottom: 0.setHeight,
            child: Image.asset(
              AppAssets.imgDummyFindJob,
              height: 202.setHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class BrowseByCategoryView extends StatefulWidget {
  final List<JobRoleTypesModel> jobRolesList;

  const BrowseByCategoryView({super.key, required this.jobRolesList});
  @override
  State<BrowseByCategoryView> createState() => _BrowseByCategoryViewState();
}

class _BrowseByCategoryViewState extends State<BrowseByCategoryView> {
  void _onJobTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < widget.jobRolesList.length; i++) {
        widget.jobRolesList[i].isSelected = (i == index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: CommonText(
            text: Languages.of(context).txtBrowseByCategory,
            fontSize: 20.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 12.setHeight),
        SizedBox(
          height: 110.setHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.jobRolesList.length,
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            itemBuilder: (context, index) {
              final jobType = widget.jobRolesList[index];

              return GestureDetector(
                onTap: () => _onJobTypeSelected(index),
                child: Padding(
                  padding: EdgeInsets.only(right: 12.setWidth),
                  child: Container(
                    width: 100.setHeight,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 0,
                          color: CustomAppColor.of(context).black.withOpacityPercent(.03),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(20),
                      color: jobType.isSelected ? CustomAppColor.of(context).bgContainerSecondary : CustomAppColor.of(context).bgWhiteSecondary,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          jobType.isSelected ? jobType.selectedImagePath : jobType.unselectedImagePath,
                          height: 40.setHeight,
                          width: 40.setWidth,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 12.setHeight),
                        CommonText(
                          text: jobType.jobRole ?? '',
                          fontSize: 12.setFontSize,
                          textColor: jobType.isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtSecondaryWhite,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class SuggestedJobsView extends StatelessWidget {
  final List<JobDetailsModel> jobSuggestedList;
  const SuggestedJobsView({super.key, required this.jobSuggestedList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: CommonText(
            text: Languages.of(context).txtSuggestedJobs,
            fontSize: 20.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 20.setHeight),
        SizedBox(
          height: 180.setHeight,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: jobSuggestedList.length,
            padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
            itemBuilder: (context, index) {
              final jobType = jobSuggestedList[index];

              return GestureDetector(
                onTap: () => Navigator.push(context, JobDetailsScreen.route(isFromCompany: false, isFromDescription: false, isFromReview: false)),
                child: Padding(
                  padding: EdgeInsets.only(right: 12.setWidth),
                  child: Container(
                    width: 280.setWidth,
                    padding: EdgeInsets.only(left: 26.setWidth, top: 20.setHeight, bottom: 20.setHeight, right: 10.setWidth),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: const Offset(0, 4),
                          blurRadius: 20,
                          spreadRadius: 0,
                          color: CustomAppColor.of(context).black.withOpacityPercent(.03),
                        ),
                      ],
                      image: const DecorationImage(image: AssetImage(AppAssets.imgCardBackground), fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(20),
                      color: index.isOdd ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).bgSecondary,
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 50.setHeight,
                                  width: 46.setWidth,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: CustomAppColor.of(context).white,
                                        width: 8,
                                      ),
                                      shape: BoxShape.circle),
                                  child: Image.asset(
                                    jobType.jobProfileImagePath,
                                    height: 46.setHeight,
                                    width: 46.setWidth,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(width: 16.setWidth),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CommonText(
                                      text: jobType.jobName,
                                      fontSize: 16.setFontSize,
                                      textColor: CustomAppColor.of(context).txtWhite,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    CommonText(
                                      text: jobType.companyName ?? '',
                                      fontSize: 14.setFontSize,
                                      textColor: CustomAppColor.of(context).txtWhite,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(width: 16.setWidth),
                            Padding(
                              padding: EdgeInsets.only(top: 4.setHeight),
                              child: jobType.isSaved ?? false
                                  ? Image.asset(
                                      AppAssets.icBookmarkUnsaved,
                                      height: 20.setHeight,
                                      width: 20.setWidth,
                                    )
                                  : Image.asset(
                                      AppAssets.icBookmarkAdd,
                                      height: 19.setHeight,
                                      width: 19.setWidth,
                                    ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: jobType.jobType
                              .map(
                                (type) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 8.setWidth),
                                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 4.setHeight),
                                  decoration: BoxDecoration(
                                    color: CustomAppColor.of(context).white.withOpacityPercent(0.15),
                                    borderRadius: BorderRadius.circular(65),
                                  ),
                                  child: CommonText(
                                    text: type,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11.setFontSize,
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(height: 20.setHeight),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CommonText(
                                  text: "\$${jobType.salary}",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                                CommonText(
                                  text: "/year",
                                  fontSize: 10.setFontSize,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(width: 5.setWidth),
                                CommonText(
                                  text: "${jobType.city} ${jobType.state}",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w400,
                                ),
                              ],
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 72.setWidth,
                              height: 24.setHeight,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: CustomAppColor.of(context).white.withOpacityPercent(0.15)),
                              child: CommonText(
                                text: "Apply Now",
                                fontSize: 10.setFontSize,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class RecentJobsView extends StatelessWidget {
  final List<JobDetailsModel> recentJobList;
  const RecentJobsView({super.key, required this.recentJobList});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: CommonText(
            text: Languages.of(context).txtRecentJobs,
            fontSize: 20.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            fontWeight: FontWeight.w700,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(height: 10.setHeight),
        ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: recentJobList.length,
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          itemBuilder: (context, index) {
            final jobType = recentJobList[index];

            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.setWidth),
              child: Container(
                width: 280.setWidth,
                padding: EdgeInsets.symmetric(vertical: 20.setHeight, horizontal: 15.setWidth),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      spreadRadius: 0,
                      color: CustomAppColor.of(context).black.withOpacityPercent(.03),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: CustomAppColor.of(context).bgWhiteSecondary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset(
                      jobType.jobProfileImagePath,
                      height: 50.setHeight,
                      width: 50.setWidth,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(width: 20.setWidth),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: CommonText(
                                  text: jobType.jobName,
                                  textAlign: TextAlign.start,
                                  fontSize: 16.setFontSize,
                                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                                  fontWeight: FontWeight.w700,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                              CommonText(
                                text: "\$${jobType.salary}/m",
                                fontSize: 12.setFontSize,
                                fontWeight: FontWeight.w500,
                                textColor: CustomAppColor.of(context).txtGreyWhite,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.setHeight),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icJobTitle,
                                    width: 15.setWidth,
                                    height: 15.setHeight,
                                    color: CustomAppColor.of(context).icPrimary,
                                  ),
                                  SizedBox(width: 4.setWidth),
                                  CommonText(
                                    text: jobType.jobType.first,
                                    fontSize: 12.setFontSize,
                                    textColor: CustomAppColor.of(context).txtGreyWhite,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                              SizedBox(width: 16.setWidth),
                              Row(
                                children: [
                                  Image.asset(
                                    AppAssets.icLocation,
                                    width: 15.setWidth,
                                    height: 15.setHeight,
                                    color: CustomAppColor.of(context).icPrimary,
                                  ),
                                  SizedBox(width: 4.setWidth),
                                  Row(
                                    children: [
                                      CommonText(
                                        text: jobType.city,
                                        fontSize: 12.setFontSize,
                                        fontWeight: FontWeight.w400,
                                        textColor: CustomAppColor.of(context).txtGreyWhite,
                                      ),
                                      Visibility(
                                        visible: jobType.state != null,
                                        child: CommonText(
                                          text: ",${jobType.state}",
                                          fontSize: 12.setFontSize,
                                          fontWeight: FontWeight.w400,
                                          textColor: CustomAppColor.of(context).txtGrey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
