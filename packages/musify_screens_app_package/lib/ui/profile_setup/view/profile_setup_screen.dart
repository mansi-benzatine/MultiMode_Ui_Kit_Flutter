import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:musify_screens_app_package/dialogs/alerts/congratulations_dialog.dart';
import 'package:musify_screens_app_package/localization/language/languages.dart';
import 'package:musify_screens_app_package/utils/app_assets.dart';
import 'package:musify_screens_app_package/utils/utils.dart';

import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final int currentIndex;
  final bool isForDialog;
  static Route<void> route({int currentIndex = 0, bool isForDialog = false}) {
    return MaterialPageRoute(
        builder: (_) => ProfileSetupScreen(
              currentIndex: currentIndex,
              isForDialog: isForDialog,
            ));
  }

  const ProfileSetupScreen({super.key, this.currentIndex = 0, this.isForDialog = false});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: widget.currentIndex);
    currentPage = widget.currentIndex;
    pageController.addListener(() {
      setState(() {});
    });
    if (widget.isForDialog) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
          builder: (dialogContext) => PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (!didPop) {
                Navigator.pop(dialogContext);
                Navigator.pop(context);
              }
            },
            child: CongratulationsDialog(
              title: Languages.of(context).txtCongratulations,
              message: Languages.of(context).txtYourAccountIsReadyToUse,
              onComplete: () {},
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackgroundPlain),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.setHeight),

                    // Header with back button and skip
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              AppAssets.icBack,
                              width: 30.setWidth,
                              height: 30.setHeight,
                              color: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ),
                        SizedBox(width: 50.setWidth),
                        Expanded(
                          child: LinearProgressIndicator(
                            value: (currentPage + 1) / 5,
                            backgroundColor: CustomAppColor.of(context).primary.withOpacityPercent(0.3),
                            borderRadius: BorderRadius.circular(2.setWidth),
                            valueColor: AlwaysStoppedAnimation(CustomAppColor.of(context).primary),
                          ),
                        ),
                        SizedBox(width: 50.setWidth),
                        (currentPage < 4)
                            ? GestureDetector(
                                onTap: () {
                                  // Handle skip
                                  /* pageController.animateToPage(
                                    currentPage + 1,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );*/
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.setWidth),
                                  child: CommonText(
                                    text: Languages.of(context).txtSkip,
                                    fontSize: 16.setFontSize,
                                    fontWeight: FontWeight.w500,
                                    textColor: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ],
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
                        child: PageView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: pageController,
                          onPageChanged: (int index) {
                            setState(() {
                              currentPage = index;
                            });
                          },
                          children: const [
                            FavoriteSinger(),
                            ChooseDateOfBirth(),
                            ChooseGender(),
                            ChooseLanguage(),
                            ChooseMusicCategory(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 20,
                  left: 20.setWidth,
                  right: 20.setWidth,
                  child: IgnorePointer(
                    ignoring: true,
                    child: CommonButton(
                      text: Languages.of(context).txtNext,
                      onTap: () {
                        if (currentPage < 4) {
                          pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                          currentPage++;
                        } else {
                          // Handle last page
                          showDialog(
                              context: context,
                              barrierColor: CustomAppColor.of(context).txtBlack.withOpacityPercent(0.3),
                              builder: (context) => CongratulationsDialog(
                                    title: Languages.of(context).txtCongratulations,
                                    message: Languages.of(context).txtYourAccountIsReadyToUse,
                                    onComplete: () {
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => const DashboardScreen()));
                                    },
                                  ));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FavoriteSinger extends StatefulWidget {
  const FavoriteSinger({super.key});

  @override
  State<FavoriteSinger> createState() => _FavoriteSingerState();
}

class _FavoriteSingerState extends State<FavoriteSinger> {
  List<String> selectedSingers = [];
  String selectedSinger = 'Justin Bieber';
  String selectedSinger1 = 'Taylor Swift';

  final List<Map<String, String>> singers = Constant.artistList;

  void toggleSingerSelection(String singerName) {
    setState(() {
      if (selectedSingers.contains(singerName)) {
        selectedSingers.remove(singerName);
      } else {
        selectedSingers.add(singerName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        children: [
          SizedBox(height: 20.setHeight),
          // Title
          CommonText(
            text: Languages.of(context).txtWhoIsYourFavouriteSinger,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 8.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtChooseYourFavouriteSingers,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 30.setHeight),

          // Singers grid
          Wrap(
            spacing: 20.setWidth,
            runSpacing: 20.setHeight,
            children: singers.map((singer) {
              final isSelected = selectedSingers.contains(singer['name']);
              final isSelectedSinger = selectedSinger == singer['name'] || selectedSinger1 == singer['name'];
              return GestureDetector(
                onTap: () => toggleSingerSelection(singer['name']!),
                child: Column(
                  children: [
                    Container(
                      width: 95.setWidth,
                      height: 95.setHeight,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: (isSelected || isSelectedSinger)
                            ? Border.all(
                                color: CustomAppColor.of(context).primary,
                                width: 4.setWidth,
                              )
                            : null,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          singer['image']!,
                          width: 80.setWidth,
                          height: 80.setHeight,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 60.setWidth,
                              height: 60.setHeight,
                              color: CustomAppColor.of(context).txtGray.withOpacityPercent(0.3),
                              child: Icon(
                                Icons.person,
                                color: CustomAppColor.of(context).txtGray,
                                size: 30.setWidth,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: 8.setHeight),
                    CommonText(
                      text: singer['name']!,
                      fontSize: 14.setFontSize,
                      fontWeight: FontWeight.w600,
                      textColor: (isSelected || isSelectedSinger) ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                  ],
                ),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}

class ChooseDateOfBirth extends StatefulWidget {
  const ChooseDateOfBirth({super.key});

  @override
  State<ChooseDateOfBirth> createState() => _ChooseDateOfBirthState();
}

class _ChooseDateOfBirthState extends State<ChooseDateOfBirth> {
  final List<int> dates = List.generate(31, (index) => index + 1);
  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
  final List<int> years = List.generate(125, (index) => DateTime.now().year - index);

  final ValueNotifier<int> selectedDate = ValueNotifier(5);
  final ValueNotifier<String> selectedMonth = ValueNotifier('Jun');
  final ValueNotifier<int> selectedYear = ValueNotifier(2000);

  final FixedExtentScrollController _dateController = FixedExtentScrollController(initialItem: 4);
  final FixedExtentScrollController _monthController = FixedExtentScrollController(initialItem: 5);
  final FixedExtentScrollController _yearController = FixedExtentScrollController(initialItem: 25);

  @override
  void dispose() {
    _dateController.dispose();
    _monthController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  int getDaysInMonth(int month, int year) {
    return DateTime(year, month + 1, 0).day;
  }

  Widget buildDatePicker() {
    return Container(
      height: 0.screenHeight / 5,
      width: 0.screenWidth,
      padding: EdgeInsets.symmetric(horizontal: 0.screenWidth / 7),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              scrollController: _monthController,
              itemExtent: 50.setHeight,
              onSelectedItemChanged: (index) {
                selectedMonth.value = months[index];
              },
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).transparent,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack),
                  ),
                ),
              ),
              children: months.map((month) {
                return Center(
                  child: ValueListenableBuilder(
                    valueListenable: selectedMonth,
                    builder: (context, selectedValue, child) {
                      final isSelected = month == selectedValue;
                      return CommonText(
                        text: month,
                        fontSize: isSelected ? 20.setFontSize : 20.setFontSize,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 20.setWidth),
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              scrollController: _dateController,
              itemExtent: 50.setHeight,
              onSelectedItemChanged: (index) {
                selectedDate.value = dates[index];
              },
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).transparent,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack),
                  ),
                ),
              ),
              children: dates.map((date) {
                return Center(
                  child: ValueListenableBuilder(
                    valueListenable: selectedDate,
                    builder: (context, selectedValue, child) {
                      final isSelected = date == selectedValue;
                      return CommonText(
                        text: "$date",
                        fontSize: isSelected ? 20.setFontSize : 20.setFontSize,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 20.setWidth),
          Expanded(
            flex: 1,
            child: CupertinoPicker(
              scrollController: _yearController,
              itemExtent: 50.setHeight,
              onSelectedItemChanged: (index) {
                selectedYear.value = years[index];
              },
              selectionOverlay: Container(
                decoration: BoxDecoration(
                  color: CustomAppColor.of(context).transparent,
                  border: Border.symmetric(
                    horizontal: BorderSide(color: CustomAppColor.of(context).txtBlack),
                  ),
                ),
              ),
              children: years.map((year) {
                return Center(
                  child: ValueListenableBuilder(
                    valueListenable: selectedYear,
                    builder: (context, selectedValue, child) {
                      final isSelected = year == selectedValue;
                      return CommonText(
                        text: "$year",
                        fontSize: isSelected ? 20.setFontSize : 20.setFontSize,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
                        textAlign: TextAlign.center,
                      );
                    },
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtWhatYourDateOfBirth,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            height: 0.98,
            maxLines: 2,
          ),

          SizedBox(height: 12.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtChooseYourDateOfBirth,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 60.setHeight),

          // Date picker
          buildDatePicker(),
        ],
      ),
    );
  }
}

class ChooseGender extends StatefulWidget {
  const ChooseGender({super.key});

  @override
  State<ChooseGender> createState() => _ChooseGenderState();
}

class _ChooseGenderState extends State<ChooseGender> {
  String selectedGender = 'Female';

  final List<String> genders = ['Female', 'Male', 'Non-Binary', 'Other'];

  Widget buildGenderOption(String gender) {
    final isSelected = selectedGender == gender;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 14.setWidth,
          vertical: 5.setHeight,
        ),
        decoration: BoxDecoration(
          color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).transparent,
          borderRadius: BorderRadius.circular(25.setWidth),
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray.withOpacityPercent(0.5),
            width: 1.5,
          ),
        ),
        child: CommonText(
          text: gender,
          fontSize: 15.setFontSize,
          fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400,
          textColor: isSelected ? CustomAppColor.of(context).txtRoundTabSelected : CustomAppColor.of(context).txtGray,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtWhatsYourGender,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            height: 1,
            maxLines: 2,
          ),

          SizedBox(height: 8.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtChooseYourGender,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
          ),

          SizedBox(height: 30.setHeight),

          // Gender options
          Wrap(
            spacing: 12.setWidth,
            runSpacing: 12.setHeight,
            children: genders.map((gender) => buildGenderOption(gender)).toList(),
          ),
        ],
      ),
    );
  }
}

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({super.key});

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String selectedLanguage = 'English';

  final List<String> languages = [
    'English',
    'Hindi',
    'Arabic',
    'Bengali',
    'Chinese',
    'French',
    'German',
    'Hausa',
    'Italian',
    'Japanese',
    'Korean',
    'Portuguese',
    'Russian',
    'Spanish',
    'Swahili',
    'Turkish',
    'Ukrainian',
    'Urdu',
    'Vietnamese',
    'Yoruba',
    'Zulu'
  ];

  Widget buildLanguageOption(String language) {
    final isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.setWidth, vertical: 10.setWidth),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).transparent,
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray.withOpacityPercent(0.5),
            width: !isSelected ? 1.5 : 2,
          ),
        ),
        alignment: Alignment.center,
        child: CommonText(
          text: language,
          fontSize: 18.setFontSize,
          fontWeight: FontWeight.w600,
          textColor: isSelected ? CustomAppColor.of(context).txtBlack : CustomAppColor.of(context).txtGray,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtWichYourFavLanguage,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            height: 0.98,
            maxLines: 2,
          ),

          SizedBox(height: 8.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtChooseYourLanguage,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 24.setHeight),

          // Gender options
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 24.setWidth,
              mainAxisSpacing: 24.setHeight,
            ),
            padding: EdgeInsets.symmetric(horizontal: 22.setWidth),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              return buildLanguageOption(language);
            },
          ),
        ],
      ),
    );
  }
}

class ChooseMusicCategory extends StatefulWidget {
  const ChooseMusicCategory({super.key});

  @override
  State<ChooseMusicCategory> createState() => _ChooseMusicCategoryState();
}

class _ChooseMusicCategoryState extends State<ChooseMusicCategory> {
  List<String> selectedCategories = ['Rock', 'Epic', 'Lo-Fi', 'Pop', 'Deep', 'Relax', 'Electronic'];

  // Define categories with their grid configurations
  final List<Map<String, dynamic>> categoryData = [
    {'name': 'Pop', 'crossAxisCellCount': 1, 'mainAxisCellCount': 2},
    {'name': 'Rock', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Epic', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Lo-Fi', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Symphonic', 'crossAxisCellCount': 2, 'mainAxisCellCount': 1},
    {'name': 'Deep', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Jazz', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'R&B', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Romantic', 'crossAxisCellCount': 2, 'mainAxisCellCount': 1},
    {'name': 'Acoustic', 'crossAxisCellCount': 2, 'mainAxisCellCount': 1},
    {'name': 'Relax', 'crossAxisCellCount': 1, 'mainAxisCellCount': 2},
    {'name': 'Rap', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Sad', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Party', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Soul', 'crossAxisCellCount': 1, 'mainAxisCellCount': 1},
    {'name': 'Electronic', 'crossAxisCellCount': 3, 'mainAxisCellCount': 1},
    {'name': 'Folk', 'crossAxisCellCount': 1, 'mainAxisCellCount': 2},
    {'name': 'Disco', 'crossAxisCellCount': 3, 'mainAxisCellCount': 1},
  ];

  Widget buildCategoryTile(Map<String, dynamic> categoryInfo) {
    final String category = categoryInfo['name'];
    final isSelected = selectedCategories.contains(category);

    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            selectedCategories.remove(category);
          } else {
            selectedCategories.add(category);
          }
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12.setWidth,
          vertical: 12.setHeight,
        ),
        decoration: BoxDecoration(
          color: CustomAppColor.of(context).transparent,
          borderRadius: BorderRadius.circular(22.setWidth),
          border: Border.all(
            color: isSelected ? CustomAppColor.of(context).primary : CustomAppColor.of(context).txtGray.withOpacityPercent(0.5),
            width: !isSelected ? 1.5 : 2,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: CommonText(
            text: category,
            fontSize: 18.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.end,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 100.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20.setHeight),

          // Title
          CommonText(
            text: Languages.of(context).txtWichCategoryYouPrefer,
            fontSize: 28.setFontSize,
            fontWeight: FontWeight.w700,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 8.setHeight),

          // Subtitle
          CommonText(
            text: Languages.of(context).txtChooseYourMusicCategory,
            fontSize: 14.setFontSize,
            fontWeight: FontWeight.w400,
            textColor: CustomAppColor.of(context).txtBlack,
            textAlign: TextAlign.start,
            maxLines: 2,
            height: 0.98,
          ),

          SizedBox(height: 30.setHeight),

          // Music category options - Staggered Grid
          StaggeredGrid.count(
            crossAxisCount: 4,
            mainAxisSpacing: 8.setHeight,
            crossAxisSpacing: 8.setWidth,
            children: categoryData.map((categoryInfo) {
              return StaggeredGridTile.count(
                crossAxisCellCount: categoryInfo['crossAxisCellCount'],
                mainAxisCellCount: categoryInfo['mainAxisCellCount'],
                child: buildCategoryTile(categoryInfo),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
