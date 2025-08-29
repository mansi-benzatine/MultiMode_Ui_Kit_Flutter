import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../../../../utils/sizer_utils.dart';
import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../filter_options/view/filter_options_screen.dart';
import '../../home/datamodel/home_data.dart';
import '../../job_details/view/job_details_screen.dart';

class SavedJobsScreen extends StatefulWidget {
  final bool isForEmptyView;

  static Route<void> route({bool isForEmptyView = false}) {
    return MaterialPageRoute(
      builder: (_) => SavedJobsScreen(
        isForEmptyView: isForEmptyView,
      ),
    );
  }

  const SavedJobsScreen({super.key, this.isForEmptyView = false});

  @override
  State<SavedJobsScreen> createState() => _SavedJobsScreenState();
}

class _SavedJobsScreenState extends State<SavedJobsScreen> {
  List<JobDetailsModel> savedJobsList = [];
  TextEditingController searchController = TextEditingController();
  List<JobDetailsModel> filteredJobsList = [];

  @override
  void initState() {
    super.initState();
    if (widget.isForEmptyView) {
      savedJobsList = [];
    } else {
      fillData();
      filteredJobsList = List.from(savedJobsList);
      searchController.addListener(() {
        filterJobs(searchController.text);
      });
    }
  }

  void filterJobs(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredJobsList = List.from(savedJobsList);
      } else {
        filteredJobsList = savedJobsList.where((job) => job.jobName.toLowerCase().contains(query.toLowerCase()) || job.companyName!.toLowerCase().contains(query.toLowerCase())).toList();
      }
    });
  }

  void fillData() {
    savedJobsList = [
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarKickstarter,
        jobName: "Product Designer",
        companyName: "Kickstarter",
        jobType: ["Full-Time"],
        salary: "160,00",
        city: "California",
        state: " USA",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarAcademia,
        jobName: "Graphics Designer",
        companyName: "Academia Education",
        jobType: ["Part-Time"],
        salary: "115,000",
        city: "Los Angels",
        state: " US",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarTwitch,
        jobName: "UI/UX Designer",
        companyName: "Twitch",
        jobType: ["Remote"],
        salary: "96,000",
        city: "San Francisco",
        state: " US",
      ),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarVkontakte,
        jobName: "Product Designer",
        companyName: "Vkontakte",
        jobType: ["Full-Time"],
        salary: "160,00",
        city: "California",
        state: " USA",
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomAppColor.of(context).bgScreenWhite,
      child: Column(
        children: [
          IgnorePointer(ignoring: true, child: SearchAndFilterView(controller: searchController)),
          Expanded(
            child: SingleChildScrollView(
              child: filteredJobsList.isEmpty ? const EmptyView() : IgnorePointer(ignoring: true, child: ApplicationsList(applicationsList: filteredJobsList)),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchAndFilterView extends StatelessWidget {
  final TextEditingController controller;
  const SearchAndFilterView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 50.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).bgContainerPrimary,
            border: Border(
              top: BorderSide(
                width: 0,
                color: CustomAppColor.of(context).bgContainerPrimary,
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
                    controller: controller,
                    hintText: Languages.of(context).txtSearchAJobOrPosition,
                    prefixIcon: AppAssets.icSearch,
                    hintTextFontSize: 14.setFontSize,
                    hintFontWeight: FontWeight.w400,
                    hintWordSpacing: 0.1,
                    borderColor: CustomAppColor.of(context).transparent,
                    prefixIconColor: CustomAppColor.of(context).icGrey,
                    fillColor: CustomAppColor.of(context).bgTextFormFieldGreySecondary,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, FilterOptionsScreen.route()),
                child: Container(
                  width: 52.setWidth,
                  height: 52.setHeight,
                  padding: EdgeInsets.symmetric(vertical: 12.setHeight, horizontal: 12.setWidth),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: CustomAppColor.of(context).bgContainerSecondary),
                  child: Image.asset(
                    AppAssets.icFilter,
                    height: 24.setHeight,
                    width: 24.setWidth,
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

class ApplicationsList extends StatelessWidget {
  final List<JobDetailsModel> applicationsList;
  const ApplicationsList({super.key, required this.applicationsList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: applicationsList.length,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 10.setHeight),
      itemBuilder: (context, index) {
        final jobType = applicationsList[index];

        return Padding(
          padding: EdgeInsets.only(bottom: 10.setWidth),
          child: GestureDetector(
            onTap: () => Navigator.push(context, JobDetailsScreen.route(isFromReview: false, isFromDescription: false, isFromCompany: false)),
            child: Container(
              width: 327.setWidth,
              padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 20.setWidth),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 20,
                    spreadRadius: 0,
                    color: CustomAppColor.of(context).black.withOpacityPercent(.1),
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: CustomAppColor.of(context).bgWhiteSecondary,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        jobType.jobProfileImagePath,
                        height: 44.setHeight,
                        width: 44.setWidth,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(width: 12.setWidth),
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
                                  text: "\$${jobType.salary}/y",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtSecondaryGrey,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: jobType.companyName ?? '',
                                  fontSize: 13.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  children: [
                                    CommonText(
                                      text: jobType.city,
                                      fontSize: 13.setFontSize,
                                      fontWeight: FontWeight.w400,
                                      textColor: CustomAppColor.of(context).txtGrey,
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
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                    child: Divider(
                      color: CustomAppColor.of(context).grey.withValues(alpha: 0.2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: jobType.jobType.first,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w700,
                        textColor: CustomAppColor.of(context).txtSecondaryGrey,
                      ),
                      Image.asset(
                        AppAssets.icBookmarkUnsaved,
                        height: 24.setHeight,
                        width: 24.setWidth,
                        color: CustomAppColor.of(context).icPrimary,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 111.setHeight),
        Image.asset(
          AppAssets.imgBgEmptySavedJobs,
          width: 200.setWidth,
          height: 189.setHeight,
        ),
        SizedBox(height: 25.setHeight),
        CommonText(
          text: Languages.of(context).txtNoSavedJobs,
          fontWeight: FontWeight.w700,
          fontSize: 18.setFontSize,
          textColor: CustomAppColor.of(context).txtSecondary,
        ),
        SizedBox(height: 10.setHeight),
        CommonText(
          text: Languages.of(context).txtNoSavedJobDesc,
          fontWeight: FontWeight.w400,
          fontSize: 12.setFontSize,
          textColor: CustomAppColor.of(context).txtGrey,
        )
      ],
    );
  }
}
