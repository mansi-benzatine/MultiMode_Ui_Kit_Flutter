import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/home/datamodel/home_data.dart';
import 'package:baby_bloom_screens_app/ui/my_profile/view/my_profile_screen.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/constant.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/utils/utils.dart';
import 'package:baby_bloom_screens_app/widgets/bottom_sheet/edit_due_date_bottom_sheet.dart';
import 'package:baby_bloom_screens_app/widgets/button/common_button.dart';
import 'package:baby_bloom_screens_app/widgets/text/common_text.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class HomeScreen extends StatefulWidget {
  final bool isForEditDueDateBs;

  static Route<void> route({bool isForEditDueDate = false}) {
    return MaterialPageRoute(builder: (_) => HomeScreen(isForEditDueDateBs: isForEditDueDate));
  }

  const HomeScreen({super.key, this.isForEditDueDateBs = false});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> babySizeImageList = [];
  List<ArticleData> articleList = [];
  final DateTime _currentDate = DateTime.now();
  DateTime _currentDate2 = DateTime.now();
  final currentWeekIndex = ValueNotifier<int>(0);
  bool _isBottomSheetOpen = false;

  void _fillData() {
    babySizeImageList = [
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
      AppAssets.imgHomeCarousel,
    ];

    articleList = [
      ArticleData(
        articleHeading: "Remedies to fight morning sickness",
        articleImage: AppAssets.imgArticle1,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isArticle: true,
      ),
      ArticleData(
        articleHeading: "how your baby’s organs develop",
        articleImage: AppAssets.imgArticle2,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isVideo: true,
      ),
      ArticleData(
        articleHeading: "Nutrients for pregnant women",
        articleImage: AppAssets.imgArticle3,
        articleDescription: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been...",
        isArticle: true,
      ),
    ];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fillData();

    if (widget.isForEditDueDateBs) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        setState(() {
          _isBottomSheetOpen = true;
        });
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          enableDrag: false,
          isDismissible: true,
          backgroundColor: Colors.transparent,
          builder: (_) => const EditDueDateBottomSheet(),
        ).whenComplete(
          () {
            if (_isBottomSheetOpen) {
              setState(() {
                _isBottomSheetOpen = false;
              });
              Navigator.pop(context);
            }
          },
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: !_isBottomSheetOpen,
      onPopInvokedWithResult: (didPop, result) {
        if (!didPop && _isBottomSheetOpen) {
          Navigator.pop(context);
          setState(() {
            _isBottomSheetOpen = false;
          });
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        backgroundColor: CustomAppColor.of(context).bgScreen,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      AppAssets.imgHomeBackground,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50.setHeight),
                        _topbarView(),
                        SizedBox(height: 20.setHeight),
                        _calenderView(),
                        SizedBox(height: 20.setHeight),
                        _babySizeImageView(),
                        SizedBox(height: 20.setHeight),
                        _babyDetailsView(),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    SizedBox(height: 20.setHeight),
                    _detailsCardView(),
                    SizedBox(height: 20.setHeight),
                    _yourWeeklyUpdateCardView(),
                    SizedBox(height: 20.setHeight),
                    _articleListView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _topbarView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CommonText(
              text: "Hello, Elvina Jack",
              fontFamily: Constant.fontFamilySemiBold600,
              fontSize: 18.setFontSize,
            ),
            CommonText(
              text: "In 32 weeks you are going to meet your baby",
              fontSize: 13.setFontSize,
              textColor: CustomAppColor.of(context).txtLightGrey,
            ),
          ],
        ),
        IgnorePointer(
          ignoring: true,
          child: GestureDetector(
            onTap: () => Navigator.push(context, MyProfileScreen.route()),
            child: Image.asset(
              AppAssets.imgDummyProfile,
              width: 40.setWidth,
              height: 40.setHeight,
            ),
          ),
        )
      ],
    );
  }

  _calenderView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 165.setHeight,
          decoration: BoxDecoration(
            color: CustomAppColor.of(context).cardBg,
            border: Border.all(
              color: CustomAppColor.of(context).white,
              width: 0.2,
            ),
            borderRadius: BorderRadius.circular(24),
          ),
          padding: EdgeInsets.only(left: 16.setWidth, bottom: 16.setHeight, right: 16.setWidth),
          child: CalendarCarousel(
            daysTextStyle: TextStyle(
              color: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamilySemiBold600,
              package: 'baby_bloom_screens_app',
            ),
            leftButtonIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).roundBg,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.navigate_before_rounded,
                size: 26,
              ),
            ),
            rightButtonIcon: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: CustomAppColor.of(context).roundBg,
              ),
              padding: const EdgeInsets.all(4),
              child: const Icon(
                Icons.navigate_next_rounded,
                size: 26,
              ),
            ),
            selectedDayButtonColor: CustomAppColor.of(context).secondary,
            headerTextStyle: TextStyle(
              color: CustomAppColor.of(context).secondary,
              fontFamily: Constant.fontFamilySemiBold600,
              fontSize: 16.setFontSize,
              package: 'baby_bloom_screens_app',
            ),
            weekdayTextStyle: TextStyle(
              color: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamilyMedium500,
              package: 'baby_bloom_screens_app',
            ),
            weekendTextStyle: TextStyle(
              color: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamilySemiBold600,
              package: 'baby_bloom_screens_app',
            ),
            customDayBuilder: (
              bool isSelectable,
              int index,
              bool isSelectedDay,
              bool isToday,
              bool isPrevMonthDay,
              TextStyle textStyle,
              bool isNextMonthDay,
              bool isThisMonthDay,
              DateTime day,
            ) {
              final textColor = CustomAppColor.of(context).txtBlack;

              if (!isPrevMonthDay || !isNextMonthDay) {
                return Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      radius: const Radius.circular(24),
                      strokeWidth: 0.5,
                      color: isSelectedDay ? Colors.transparent : Colors.grey,
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${day.day}',
                        style: TextStyle(
                          color: textColor.withValues(alpha: 0.5),
                          fontFamily: Constant.fontFamilyMedium500,
                          package: 'baby_bloom_screens_app',
                        ),
                      ),
                    ),
                  ),
                );
              }
              return null;
            },
            weekFormat: true,
            selectedDateTime: _currentDate2,
            showIconBehindDayText: true,
            headerTitleTouchable: false,
            customGridViewPhysics: const AlwaysScrollableScrollPhysics(),
            markedDateShowIcon: true,
            markedDateIconMaxShown: 2,
            selectedDayTextStyle: TextStyle(
              color: CustomAppColor.of(context).white,
            ),
            todayTextStyle: TextStyle(
              color: CustomAppColor.of(context).txtBlack,
              fontFamily: Constant.fontFamilySemiBold600,
              package: 'baby_bloom_screens_app',
            ),
            minSelectedDate: _currentDate.subtract(const Duration(days: 360)),
            maxSelectedDate: _currentDate.add(const Duration(days: 360)),
            todayButtonColor: const Color(0xFFFFE5EE),
            todayBorderColor: const Color(0xFFFFE5EE),
            prevMonthDayBorderColor: CustomAppColor.of(context).grey,
            nextMonthDayBorderColor: CustomAppColor.of(context).grey,
            onDayPressed: (DateTime date, List events) {
              setState(() {
                if (_currentDate2 == date) {
                  _currentDate2 = DateTime(1900);
                } else {
                  _currentDate2 = date;
                }
              });
            },
          ),
        ),
      ],
    );
  }

  _babySizeImageView() {
    return ValueListenableBuilder<int>(
      valueListenable: currentWeekIndex,
      builder: (context, index, _) {
        // final item = babySizeImageList[index];
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (index > 0) currentWeekIndex.value = index - 1;
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).setYourDueDateBtn,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_back_ios_new, size: 15),
              ),
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  AppAssets.imgRoundFrame,
                  height: 220.setHeight,
                  width: 220.setWidth,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: CustomAppColor.of(context).white,
                          width: 0.2,
                        ),
                        color: CustomAppColor.of(context).setYourDueDateBtn,
                      ),
                      padding: EdgeInsets.only(
                        bottom: 0.setHeight,
                        right: 16.setWidth,
                        left: 16.setWidth,
                        top: 26.setHeight,
                      ),
                      child: Image.asset(
                        AppAssets.img3dBaby,
                        width: 160.setWidth,
                        height: 160.setHeight,
                      ),
                    ),
                    Positioned(
                      top: 12.setHeight,
                      child: CommonText(
                        text: "${index + 1} Weeks",
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilyBold700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            InkWell(
              onTap: () {
                if (index < babySizeImageList.length - 1) {
                  currentWeekIndex.value = index + 1;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).setYourDueDateBtn,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(8),
                child: const Icon(Icons.arrow_forward_ios, size: 15),
              ),
            ),
          ],
        );
      },
    );
  }

  _babyDetailsView() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [Color(0xFFD5A5F4), Color(0xFFF3E2FF)],
              tileMode: TileMode.clamp,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12.setWidth, vertical: 12.setHeight),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFF3E2FF)),
                    padding: EdgeInsets.symmetric(vertical: 11.setHeight, horizontal: 11.setHeight),
                    child: Image.asset(
                      AppAssets.icSize,
                      height: 22.setHeight,
                      width: 22.setWidth,
                    ),
                  ),
                  SizedBox(width: 8.setWidth),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: Languages.of(context).txtSize,
                        textColor: CustomAppColor.of(context).black,
                      ),
                      CommonText(
                        text: "Raspberry",
                        textColor: CustomAppColor.of(context).black,
                        fontFamily: Constant.fontFamilyMedium500,
                        fontSize: 18.setFontSize,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 14.setHeight),
              Image.asset(
                AppAssets.icRaspberry,
                width: 84.setHeight,
                height: 66.setHeight,
              )
            ],
          ),
        ),
        SizedBox(width: 8.setWidth),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFFFACC9),
                      Color(0xFFFFE5EE),
                    ],
                    tileMode: TileMode.clamp,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 12.setHeight),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFFFE5EE)),
                          padding: EdgeInsets.symmetric(vertical: 11.setHeight, horizontal: 11.setHeight),
                          child: Image.asset(
                            AppAssets.icWeight,
                            height: 22.setHeight,
                            width: 22.setWidth,
                          ),
                        ),
                        SizedBox(width: 6.setWidth),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtWeight,
                              textColor: CustomAppColor.of(context).black,
                            ),
                            CommonText(
                              text: "1.20 kg",
                              fontFamily: Constant.fontFamilyMedium500,
                              fontSize: 18.setFontSize,
                              textColor: CustomAppColor.of(context).black,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.setHeight),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [Color(0xFFB2F67F), Color(0xFFEDFFE0)],
                    tileMode: TileMode.clamp,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 12.setHeight),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: Color(0xFFEDFFE0)),
                          padding: EdgeInsets.symmetric(vertical: 11.setHeight, horizontal: 11.setHeight),
                          child: Image.asset(
                            AppAssets.icLength,
                            color: const Color(0xFF83CA4E),
                            height: 22.setHeight,
                            width: 22.setWidth,
                          ),
                        ),
                        SizedBox(width: 6.setWidth),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              text: Languages.of(context).txtLength,
                              textColor: CustomAppColor.of(context).black,
                            ),
                            CommonText(
                              text: "1.22 in",
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).black,
                              fontSize: 18.setFontSize,
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  _detailsCardView() {
    Widget infoRow({required String asset, required String normalText, required String boldText, double padding = 8}) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: CustomAppColor.of(context).white,
              shape: BoxShape.circle,
            ),
            padding: EdgeInsets.all(padding),
            child: Image.asset(
              asset,
              height: 36.setHeight,
              width: asset == AppAssets.imgSetYourDueDate ? 32.setWidth : 22.setWidth,
            ),
          ),
          SizedBox(width: 10.setWidth),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 4.setHeight),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: normalText,
                      style: TextStyle(
                        color: CustomAppColor.of(context).txtBlack,
                        fontFamily: Constant.fontFamilyRegular400,
                        package: "baby_bloom_screens_app",
                        fontSize: 15.setFontSize,
                      ),
                    ),
                    TextSpan(
                      text: boldText,
                      style: TextStyle(
                        color: CustomAppColor.of(context).txtBlack,
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 15.setFontSize,
                        package: "baby_bloom_screens_app",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: CustomAppColor.of(context).setYourDueDateBtn,
          ),
          padding: EdgeInsets.symmetric(horizontal: 16.setWidth, vertical: 16.setHeight),
          child: Column(
            children: [
              infoRow(
                asset: AppAssets.icLovingMother,
                normalText: "We estimate your due date to be ",
                boldText: "15/04/2026.",
              ),
              SizedBox(height: 10.setHeight),
              infoRow(
                asset: AppAssets.icPregnantWomen,
                normalText: "This means you have ",
                boldText: "8 weeks and 2 days",
              ),
              SizedBox(height: 10.setHeight),
              infoRow(
                asset: AppAssets.imgSetYourDueDate,
                normalText: "This means you have ",
                boldText: "32 weeks and 4 days to go.",
                padding: 4,
              ),
              SizedBox(height: 10.setHeight),
              IgnorePointer(
                ignoring: true,
                child: CommonButton(
                  height: 44.setHeight,
                  text: Languages.of(context).txtEditDueDate,
                  image: AppAssets.icEdit,
                  imageSize: 14.setHeight,
                  onTap: () {
                    Utils.showBottomSheetDialog(
                      context,
                      isScrollControlled: true,
                      widgets: const EditDueDateBottomSheet(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _yourWeeklyUpdateCardView() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              AppAssets.imgWeeklyUpdateBackground,
            ),
          ),
          Positioned(
              right: 60.setWidth,
              top: 20.setHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                    text: "8 Weeks",
                    fontSize: 22.setFontSize,
                    textColor: CustomAppColor.of(context).black,
                    fontFamily: Constant.fontFamilySemiBold600,
                  ),
                  SizedBox(height: 5.setHeight),
                  CommonText(
                    text: Languages.of(context).txtYourWeeklyUpdates,
                    fontSize: 14.setFontSize,
                    fontFamily: Constant.fontFamilySemiBold600,
                    textColor: CustomAppColor.of(context).txtLightGrey,
                  ),
                  SizedBox(height: 12.setHeight),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 14.setWidth, vertical: 4.setHeight),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      border: Border.all(color: CustomAppColor.of(context).secondary),
                    ),
                    child: Row(
                      children: [
                        CommonText(
                          text: Languages.of(context).txtOpen,
                          fontSize: 14.setFontSize,
                          fontFamily: Constant.fontFamilySemiBold600,
                          textColor: CustomAppColor.of(context).secondary,
                        ),
                        SizedBox(width: 5.setWidth),
                        Icon(
                          Icons.arrow_forward_rounded,
                          color: CustomAppColor.of(context).secondary,
                          size: 20.setHeight,
                        )
                      ],
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  _articleListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: articleList.length,
      clipBehavior: Clip.hardEdge,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final item = articleList[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.setHeight),
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).bgScreen,
                  border: Border.all(color: CustomAppColor.of(context).grey),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(item.articleImage),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: item.articleHeading,
                      fontSize: 18.setFontSize,
                      fontFamily: Constant.fontFamilySemiBold600,
                    ),
                    SizedBox(height: 5.setHeight),
                    CommonText(
                      text: item.articleDescription,
                      fontSize: 12.setFontSize,
                      textAlign: TextAlign.start,
                      textColor: CustomAppColor.of(context).txtLightGrey,
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 20.setHeight,
                left: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: CustomAppColor.of(context).black.withValues(alpha: 0.3),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(6),
                      bottomRight: Radius.circular(6),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 4.setHeight, horizontal: 8.setWidth),
                  child: item.isArticle
                      ? Row(
                          children: [
                            Image.asset(
                              AppAssets.icArticle,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: "Article",
                              fontSize: 10.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).white,
                            )
                          ],
                        )
                      : Row(
                          children: [
                            Image.asset(
                              AppAssets.icVideo,
                              height: 16.setHeight,
                              width: 16.setWidth,
                            ),
                            SizedBox(width: 6.setWidth),
                            CommonText(
                              text: "Video",
                              fontSize: 10.setFontSize,
                              fontFamily: Constant.fontFamilyMedium500,
                              textColor: CustomAppColor.of(context).white,
                            )
                          ],
                        ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
