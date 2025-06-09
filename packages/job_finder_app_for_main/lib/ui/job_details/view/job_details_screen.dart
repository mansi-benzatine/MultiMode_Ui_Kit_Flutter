import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_finder_app_package_for_main/utils/utils.dart';

import '../../../../../../localization/language/languages.dart';
import '../../../../../../utils/app_color.dart';
import '../../../../../../utils/constant.dart';
import '../../../../../../utils/sizer_utils.dart';
import '../../../../../../widgets/text/common_text.dart';
import '../../../../../../widgets/top_bar/topbar.dart';
import '../../../interfaces/top_bar_click_listener.dart';
import '../../../utils/app_assets.dart';
import '../../../widgets/button/common_button.dart';
import '../../apply_job/view/apply_job_screen.dart';
import '../../chat/view/chat_screen.dart';
import '../datamodel/job_details_data.dart';

class JobDetailsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const JobDetailsScreen());
  }

  const JobDetailsScreen({super.key});

  @override
  State<JobDetailsScreen> createState() => _JobDetailsScreenState();
}

class _JobDetailsScreenState extends State<JobDetailsScreen> implements TopBarClickListener {
  List<String> detailsComponents = [];
  List<String> responsibilitiesList = [];
  List<String> jobOverviewList = [];
  List<String> requirementsAndSkillsList = [];
  List<String> companyOverviewList = [];
  List<CompanyData> companyDataList = [];
  List<EmployeeReviews> employeeReviewList = [];

  final PageController _pageController = PageController();
  int selectedIndex = 0;
  void fillData() {
    detailsComponents = ["Description", "Company", "Review"];
    jobOverviewList = [
      "We are looking for a Product Designer to work on various products we develop for our customers.",
      "Product Designer responsibilities include defining product specifications, creating digital or print drawings and designing fully-functional products. To be successful in this role, you should have an eye for color and shape and be able to translate requirements into practical product features."
    ];
    companyOverviewList = [
      "Facebook, American online social network service that is part of the company Meta Platforms. Facebook was founded in 2004 by Mark Zuckerberg, Eduardo Saverin, Dustin Moskovitz, and Chris Hughes, all of whom were students at Harvard University. Facebook became the largest social network in the world, with nearly three billion users as of 2021, and about half that number were using Facebook every day. The company’s headquarters are in Menlo Park, California."
    ];
    responsibilitiesList = [
      "Identify opportunities for new products",
      "Improve the design of existing products",
      "Analyze how a new product ties in with market needs and consumer preferences",
      "Set design requirements based on briefs from internal teams and external partners",
      "Research materials and techniques",
      "Sketch drafts on paper or digitally (for example, using CAD)",
      "Produce prototypes and test functionality",
      "Use 3D modeling software to design products and components"
    ];
    requirementsAndSkillsList = [
      "Work experience as a Product Designer or similar role",
      "Experience in industrial design",
      "Creativity in mixing up colors, shapes and techniques",
      "Hands-on experience with computer-aided design (CAD) tools",
      "Good knowledge of 3D modeling software",
      "Experience with design programs (like Illustrator and Sketch)",
      "Time-management skills & Adaptability",
      "BSc/MSc in Product Design, Manufacturing Design Engineering or relevant field",
    ];
    companyDataList = [
      CompanyData(
        imagePath: AppAssets.icWebsite,
        heading: "Website",
        description: "https://www.test.com/",
      ),
      CompanyData(
        imagePath: AppAssets.icWhiteLocations,
        heading: "Headquarters",
        description: "California, USA",
      ),
      CompanyData(
        imagePath: AppAssets.icDate,
        heading: "Founded",
        description: "2004 by Mark Zuckerberg",
      ),
      CompanyData(
        imagePath: AppAssets.icPerson,
        heading: "Size",
        description: "5,000 Employee",
      ),
      CompanyData(
        imagePath: AppAssets.icWallet,
        heading: "Revenue",
        description: "\$25,000 Billion",
      ),
    ];
    employeeReviewList = [
      EmployeeReviews(
        profilePath: AppAssets.imgAvatarEmpReview1,
        username: "Martin Lauther",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.",
        date: "8 days ago",
        rating: 4.0,
      ),
      EmployeeReviews(
        profilePath: AppAssets.imgAvatarEmpReview2,
        username: "Dane Milliken",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.",
        date: "6 days ago",
        rating: 3.0,
      ),
      EmployeeReviews(
        profilePath: AppAssets.imgAvatarEmpReview3,
        username: "Roger Finnegan",
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud.",
        date: "4 days ago",
        rating: 2.0,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    fillData();

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
        statusBarColor: CustomAppColor.of(context).transparent,
      ),
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreenWhite,
        body: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const JobDetailsView(),
                        SizedBox(height: 10.setHeight),
                        Container(
                          height: 40.setHeight,
                          padding: EdgeInsets.symmetric(horizontal: 2.setWidth),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: detailsComponents.length,
                            itemBuilder: (context, index) {
                              bool isSelected = selectedIndex == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedIndex = index;
                                    _pageController.animateToPage(index, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                                  });
                                },
                                child: Container(
                                  width: 110.setWidth,
                                  height: 40.setHeight,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                                  margin: EdgeInsets.symmetric(horizontal: 5.setWidth),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        offset: const Offset(0, 4),
                                        blurRadius: 20,
                                        spreadRadius: 0,
                                        color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(20),
                                    color: isSelected ? CustomAppColor.of(context).icPrimary : CustomAppColor.of(context).bgWhiteSecondary,
                                  ),
                                  child: CommonText(
                                    text: detailsComponents[index],
                                    fontSize: 12.setFontSize,
                                    fontWeight: FontWeight.w600,
                                    textAlign: TextAlign.center,
                                    textColor: isSelected ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).txtSecondaryWhite,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 1150.setHeight,
                          child: PageView(
                            controller: _pageController,
                            onPageChanged: (index) {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            children: [
                              Description(
                                responsibilitiesList: responsibilitiesList,
                                requirementAndSkillList: requirementsAndSkillsList,
                                jobOverviewList: jobOverviewList,
                              ),
                              Company(
                                companyOverviewList: companyOverviewList,
                                companyDataList: companyDataList,
                              ),
                              Review(employeeReviewList: employeeReviewList),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TopBar(
                    this,
                    isShowBack: true,
                    iconColor: CustomAppColor.of(context).white,
                    title: "",
                    isShowBookmarkAdd: true,
                    isShowChat: true,
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: _ContinueButtonView(
                onTap: () => Navigator.push(context, ApplyJobScreen.route()),
                buttonText: Languages.of(context).txtApplyJob,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
    if (name == Constant.strChat) {
      Navigator.push(context,
          ChatScreen.route(userName: "Julie Young", userProfile: AppAssets.imgAvatarMessage3, lastMessage: "Alex – CV / UI/UX Designer.pdf"));
    }
  }
}

class Description extends StatelessWidget {
  final List<String> responsibilitiesList;
  final List<String> requirementAndSkillList;
  final List<String> jobOverviewList;

  const Description({
    super.key,
    required this.responsibilitiesList,
    required this.requirementAndSkillList,
    required this.jobOverviewList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
          child: Container(
            width: 327.setWidth,
            padding: EdgeInsets.symmetric(horizontal: 17.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtJobOverview,
                  textAlign: TextAlign.start,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                ),
                SizedBox(height: 10.setHeight),
                Column(
                  children: jobOverviewList.map((item) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                      child: CommonText(
                        text: item,
                        textAlign: TextAlign.start,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGrey,
                        height: 1.6,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
          child: Container(
            width: 327.setWidth,
            padding: EdgeInsets.symmetric(horizontal: 17.setWidth, vertical: 18.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtResponsibility,
                  textAlign: TextAlign.start,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                ),
                SizedBox(height: 10.setHeight),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: responsibilitiesList.map((item) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 5.setHeight),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "•  ",
                            fontSize: 14.setFontSize,
                            textColor: CustomAppColor.of(context).txtGrey,
                            fontWeight: FontWeight.w400,
                          ), // Bullet point
                          Expanded(
                            child: CommonText(
                              text: item,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              height: 1.9,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
          child: Container(
            width: 327.setWidth,
            padding: EdgeInsets.symmetric(horizontal: 17.setWidth, vertical: 15.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtRequirementAndSkills,
                  textAlign: TextAlign.start,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                ),
                SizedBox(height: 10.setHeight),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: requirementAndSkillList.map((item) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 5.setHeight),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CommonText(
                            text: "•  ",
                            fontSize: 14.setFontSize,
                            textColor: CustomAppColor.of(context).txtGrey,
                            fontWeight: FontWeight.w400,
                          ), // Bullet point
                          Expanded(
                            child: CommonText(
                              text: item,
                              fontSize: 12.setFontSize,
                              fontWeight: FontWeight.w400,
                              textAlign: TextAlign.start,
                              height: 1.9,
                              textColor: CustomAppColor.of(context).txtGrey,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Company extends StatelessWidget {
  final List<String> companyOverviewList;
  final List<CompanyData> companyDataList;
  const Company({super.key, required this.companyOverviewList, required this.companyDataList});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
          child: Container(
            width: 327.setWidth,
            padding: EdgeInsets.symmetric(horizontal: 17.setWidth, vertical: 20.setHeight),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtCompanyOverview,
                  textAlign: TextAlign.start,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                ),
                SizedBox(height: 10.setHeight),
                Column(
                  children: companyOverviewList.map((item) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 4.setHeight),
                      child: CommonText(
                        text: item,
                        textAlign: TextAlign.start,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w400,
                        textColor: CustomAppColor.of(context).txtGrey,
                        height: 1.7,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.setHeight),
            width: 327.setWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              children: companyDataList.map((company) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 38.setWidth,
                        height: 38.setHeight,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomAppColor.of(context).icPrimary,
                        ),
                        child: Image.asset(
                          company.imagePath,
                          height: 24.setHeight,
                          width: 24.setWidth,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(width: 12.setWidth),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: company.heading,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.setFontSize,
                              textColor: CustomAppColor.of(context).txtBlack,
                            ),
                            SizedBox(height: 4.setHeight),
                            CommonText(
                              text: company.description,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.setFontSize,
                              textColor: CustomAppColor.of(context).txtGrey,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 22.setHeight),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16.setHeight, horizontal: 17.setWidth),
            width: 327.setWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: CustomAppColor.of(context).bgWhiteSecondary,
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 4),
                  blurRadius: 20,
                  spreadRadius: 0,
                  color: CustomAppColor.of(context).black.withOpacityPercent(.08),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: Languages.of(context).txtCompanyGallery,
                  textAlign: TextAlign.start,
                  fontSize: 18.setFontSize,
                  fontWeight: FontWeight.w700,
                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                ),
                SizedBox(height: 13.setHeight),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.imgDummyCompanyGallery1,
                      width: 100.setWidth,
                      height: 100.setHeight,
                    ),
                    SizedBox(width: 13.setWidth),
                    Image.asset(
                      AppAssets.imgDummyCompanyGallery2,
                      width: 180.setWidth,
                      height: 100.setHeight,
                    )
                  ],
                ),
                SizedBox(height: 13.setHeight),
                Row(
                  children: [
                    Image.asset(
                      AppAssets.imgDummyCompanyGallery3,
                      width: 180.setWidth,
                      height: 100.setHeight,
                    ),
                    SizedBox(width: 13.setWidth),
                    Image.asset(
                      AppAssets.imgDummyCompanyGallery4,
                      width: 100.setWidth,
                      height: 100.setHeight,
                    )
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Review extends StatelessWidget {
  final List<EmployeeReviews> employeeReviewList;
  const Review({super.key, required this.employeeReviewList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22.setHeight),
            child: Container(
              width: 332.setWidth,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: CustomAppColor.of(context).bgWhiteSecondary,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacityPercent(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonText(
                    text: Languages.of(context).txtOverallReview,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.setFontSize,
                    textColor: CustomAppColor.of(context).txtGreyWhite,
                  ),
                  const SizedBox(height: 8),
                  CommonText(
                    text: "4.7",
                    fontWeight: FontWeight.w700,
                    fontSize: 54.setFontSize,
                    textColor: CustomAppColor.of(context).icPrimary,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) {
                      return const Icon(Icons.star, color: Colors.amber, size: 24);
                    }),
                  ),
                  const SizedBox(height: 8),
                  CommonText(
                    text: "Based on 20K+ Reviews",
                    fontWeight: FontWeight.w500,
                    fontSize: 14.setFontSize,
                    textColor: CustomAppColor.of(context).txtGreyWhite,
                  ),
                  const SizedBox(height: 16),
                  buildStarRow(context, Languages.of(context).txtFiveStar, 0.8, Colors.green),
                  buildStarRow(context, Languages.of(context).txtFourStar, 0.1, Colors.lightGreen),
                  buildStarRow(context, Languages.of(context).txtThreeStar, 0.05, Colors.orange),
                  buildStarRow(context, Languages.of(context).txtTwoStar, 0.03, Colors.deepOrange),
                  buildStarRow(context, Languages.of(context).txtOneStar, 0.02, Colors.red),
                ],
              ),
            ),
          ),
          CommonText(
            text: Languages.of(context).txtEmployeeReviews,
            fontWeight: FontWeight.w700,
            fontSize: 20.setFontSize,
            textColor: CustomAppColor.of(context).txtSecondaryWhite,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 10.setHeight),
          Column(
            children: employeeReviewList.map((item) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 10.setHeight),
                child: Container(
                  width: 335.setWidth,
                  padding: EdgeInsets.symmetric(horizontal: 22.setWidth, vertical: 18.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CustomAppColor.of(context).bgWhiteSecondary,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacityPercent(0.1),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            item.profilePath,
                            width: 50.setWidth,
                            height: 50.setHeight,
                          ),
                          SizedBox(width: 10.setWidth),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                  text: item.username,
                                  fontSize: 16.setFontSize,
                                  fontWeight: FontWeight.w700,
                                  textColor: CustomAppColor.of(context).txtSecondaryWhite,
                                ),
                                SizedBox(height: 6.setHeight),
                                Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(5, (index) {
                                        return Icon(
                                          Icons.star,
                                          color:
                                              index < item.rating.toDouble() ? Colors.amber : CustomAppColor.of(context).grey.withOpacityPercent(0.3),
                                          size: 16,
                                        );
                                      }),
                                    ),
                                    SizedBox(width: 12.setWidth),
                                    CommonText(
                                      text: "(${item.rating.toString()})",
                                      textColor: CustomAppColor.of(context).txtGrey,
                                      fontSize: 12.setFontSize,
                                      fontWeight: FontWeight.w500,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          CommonText(
                            text: item.date,
                            textColor: CustomAppColor.of(context).txtGreyWhite,
                            fontSize: 12.setFontSize,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: 16.setHeight),
                      CommonText(
                        text: item.review,
                        textColor: CustomAppColor.of(context).txtGrey,
                        fontSize: 12.setFontSize,
                        fontWeight: FontWeight.w500,
                        textAlign: TextAlign.start,
                        height: 1.6,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget buildStarRow(BuildContext context, String label, double percentage, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          SizedBox(
            width: 50.setWidth,
            child: CommonText(
              text: label,
              fontWeight: FontWeight.w500,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtSecondaryWhite,
            ),
          ),
          Expanded(
            child: LinearProgressIndicator(
              value: percentage,
              backgroundColor: CustomAppColor.of(context).ratingDivider,
              valueColor: AlwaysStoppedAnimation<Color>(color),
              minHeight: 8,
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          SizedBox(width: 8.setWidth),
          SizedBox(
            width: 40.setWidth,
            child: CommonText(
              text: "${(percentage * 100).toInt()}%",
              fontWeight: FontWeight.w500,
              fontSize: 14.setFontSize,
              textColor: CustomAppColor.of(context).txtGreyWhite,
            ),
          ),
        ],
      ),
    );
  }
}

class JobDetailsView extends StatelessWidget {
  const JobDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: SlopedBottomClipper(),
      child: Container(
        width: 375.setWidth,
        height: 326.setHeight,
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).bgSecondary,
          image: const DecorationImage(
            image: AssetImage(AppAssets.imgCardBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 80.setWidth,
              height: 80.setHeight,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: CustomAppColor.of(context).white,
                  width: 8,
                ),
              ),
              child: Image.asset(
                AppAssets.icAvatarKickstarter,
                width: 60.setWidth,
                height: 60.setHeight,
              ),
            ),
            SizedBox(height: 12.setHeight),
            CommonText(
              text: "Product Designer",
              fontWeight: FontWeight.w700,
              fontSize: 20.setFontSize,
            ),
            SizedBox(height: 4.setHeight),
            CommonText(
              text: "Kickstarter",
              fontWeight: FontWeight.w500,
              fontSize: 14.setFontSize,
            ),
            SizedBox(height: 14.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 8.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CustomAppColor.of(context).white.withOpacityPercent(0.15),
                  ),
                  child: CommonText(
                    text: "Design",
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CustomAppColor.of(context).white.withOpacityPercent(0.15),
                  ),
                  child: CommonText(
                    text: "Full-Time",
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 5.setHeight),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: CustomAppColor.of(context).white.withOpacityPercent(0.15),
                  ),
                  child: CommonText(
                    text: "Junior",
                    fontSize: 11.setFontSize,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 24.setHeight),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    CommonText(
                      text: "\$160,00/",
                      fontWeight: FontWeight.w700,
                      fontSize: 16.setFontSize,
                    ),
                    CommonText(
                      text: "year",
                      fontWeight: FontWeight.w700,
                      fontSize: 14.setFontSize,
                    ),
                  ],
                ),
                CommonText(
                  text: "California, USA",
                  fontWeight: FontWeight.w700,
                  fontSize: 16.setFontSize,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SlopedBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double slopeHeight = 30.0;
    double cornerRadius = 40.0;

    Path path = Path();
    path.lineTo(0, size.height - slopeHeight - cornerRadius);
    path.quadraticBezierTo(0, size.height - slopeHeight, cornerRadius, size.height - slopeHeight);
    path.lineTo(size.width - cornerRadius, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height - cornerRadius);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class _ContinueButtonView extends StatelessWidget {
  final String buttonText;
  final Function()? onTap;
  const _ContinueButtonView({required this.buttonText, this.onTap});

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
          onTap: onTap,
          text: buttonText,
          buttonTextSize: 18.setFontSize,
          buttonTextWeight: FontWeight.w500,
          buttonColor: CustomAppColor.of(context).txtSecondary,
        ),
      ),
    );
  }
}
