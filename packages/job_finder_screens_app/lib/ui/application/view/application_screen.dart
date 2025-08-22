import 'package:flutter/material.dart';
import 'package:job_finder_screens_app_package/utils/utils.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/text_field/text_form_field.dart';
import '../../applied_job_details/view/applied_job_details_screen.dart';
import '../../filter_options/view/filter_options_screen.dart';
import '../../home/datamodel/home_data.dart';
import '../../search_job/view/search_job_screen.dart';

class ApplicationScreen extends StatefulWidget {
  const ApplicationScreen({super.key});

  @override
  State<ApplicationScreen> createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  List<String> applicationStatusList = [];
  List<JobDetailsModel> applicationsList = [];
  final ValueNotifier<String> selectedValue = ValueNotifier<String>("All");
  void fillData() {
    applicationsList = [
      JobDetailsModel(
          jobProfileImagePath: AppAssets.icAvatarKickstarter, jobName: "Product Designer", companyName: "Kickstarter", jobType: ["Full-Time"], salary: "160,00", city: "California", state: " USA", applicationStatus: "Reviewing"),
      JobDetailsModel(
          jobProfileImagePath: AppAssets.icAvatarVkontakte, jobName: "Web Designer", companyName: "Vkontakte", jobType: ["Part-Time"], salary: "115,000", city: "Los Angels", state: " US", applicationStatus: "Cancelled"),
      JobDetailsModel(
        jobProfileImagePath: AppAssets.icAvatarMeetup,
        jobName: "Visual Designer",
        companyName: "MeetUp",
        jobType: ["Remote"],
        salary: "96,000",
        city: "San Francisco",
        state: " US",
        applicationStatus: "Delivered",
      )
    ];
    applicationStatusList = ["All", "Reviewing", "Delivered", "Cancelled"];
  }

  @override
  Widget build(BuildContext context) {
    fillData();
    return Column(
      children: [
        const IgnorePointer(ignoring: true, child: SearchAndFilterView()),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [ApplicationStatusList(applicationStatusList: applicationStatusList, selectedStatus: selectedValue), IgnorePointer(ignoring: true, child: ApplicationsList(applicationsList: applicationsList))],
            ),
          ),
        )
      ],
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
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: CustomAppColor.of(context).icPrimary),
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

class ApplicationStatusList extends StatelessWidget {
  final List<String> applicationStatusList;
  final ValueNotifier<String> selectedStatus;

  const ApplicationStatusList({
    super.key,
    required this.applicationStatusList,
    required this.selectedStatus,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.setHeight,
      child: ValueListenableBuilder<String>(
        valueListenable: selectedStatus,
        builder: (context, selected, _) {
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: applicationStatusList.length,
            itemBuilder: (context, index) {
              final status = applicationStatusList[index];
              final isSelected = selected == status;

              return GestureDetector(
                onTap: () => selectedStatus.value = status,
                child: Container(
                  height: 37.setHeight,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 5.setWidth),
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                  decoration: BoxDecoration(
                    color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).bgScreenWhite,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: CustomAppColor.of(context).icPrimary,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: CommonText(
                      text: status,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w500,
                      textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).icPrimary,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
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
      physics: const AlwaysScrollableScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 14.setHeight),
      itemBuilder: (context, index) {
        final jobType = applicationsList[index];

        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.setWidth),
          child: GestureDetector(
            onTap: () => Navigator.push(context, AppliedJobDetailsScreen.route()),
            child: Container(
              width: 327.setWidth,
              padding: EdgeInsets.symmetric(vertical: 15.setHeight, horizontal: 15.setWidth),
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
                                    textColor: CustomAppColor.of(context).txtSecondary,
                                    fontWeight: FontWeight.w700,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(width: 10.setWidth),
                                CommonText(
                                  text: "\$${jobType.salary}/y",
                                  fontSize: 12.setFontSize,
                                  fontWeight: FontWeight.w500,
                                  textColor: CustomAppColor.of(context).txtSecondary,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CommonText(
                                  text: jobType.companyName ?? '',
                                  fontSize: 12.setFontSize,
                                  textColor: CustomAppColor.of(context).txtGrey,
                                  fontWeight: FontWeight.w400,
                                ),
                                Row(
                                  children: [
                                    CommonText(
                                      text: jobType.city,
                                      fontSize: 12.setFontSize,
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
                    padding: EdgeInsets.symmetric(vertical: 6.setHeight),
                    child: Divider(
                      color: CustomAppColor.of(context).grey.withValues(alpha: 0.2),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 33.setHeight,
                        width: 114.setWidth,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: jobType.applicationStatus == "Reviewing"
                              ? CustomAppColor(context).bgGreen
                              : jobType.applicationStatus == "Cancelled"
                                  ? CustomAppColor(context).bgRed
                                  : CustomAppColor(context).bgBlue,
                        ),
                        child: CommonText(
                          text: jobType.applicationStatus ?? '',
                          fontSize: 13.setFontSize,
                          textColor: jobType.applicationStatus == "Reviewing"
                              ? CustomAppColor(context).txtGreen
                              : jobType.applicationStatus == "Cancelled"
                                  ? CustomAppColor(context).red
                                  : CustomAppColor(context).txtLightBlue,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Row(
                        children: [
                          CommonText(
                            text: jobType.jobType.first,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w700,
                            textColor: CustomAppColor.of(context).txtSecondary,
                          ),
                        ],
                      ),
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
