import 'package:dating_screens_app_package/interfaces/top_bar_click_listener.dart';
import 'package:dating_screens_app_package/localization/language/languages.dart';
import 'package:dating_screens_app_package/ui/dashboard/views/dashboard_screen.dart';
import 'package:dating_screens_app_package/utils/app_assets.dart';
import 'package:dating_screens_app_package/utils/app_color.dart';
import 'package:dating_screens_app_package/utils/constant.dart';
import 'package:dating_screens_app_package/utils/sizer_utils.dart';
import 'package:dating_screens_app_package/widgets/button/common_button.dart';
import 'package:dating_screens_app_package/widgets/text/common_text.dart';
import 'package:dating_screens_app_package/widgets/text_field/text_form_field.dart';
import 'package:dating_screens_app_package/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class FillUpInformationScreen extends StatefulWidget {
  final int currentIndex;

  static Route<void> route({required int currentIndex}) {
    return MaterialPageRoute(builder: (_) => FillUpInformationScreen(currentIndex: currentIndex));
  }

  const FillUpInformationScreen({super.key, required this.currentIndex});

  @override
  State<FillUpInformationScreen> createState() => _FillUpInformationScreenState();
}

class _FillUpInformationScreenState extends State<FillUpInformationScreen> implements TopBarClickListener {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final int totalPages = 6;
  List<String> passionList = [];
  List<String> photoList = [];

  void fillData() {
    passionList = [
      "Sport",
      "Dancing",
      "Swimming",
      "Music",
      "Art",
      "Reading",
      "Environmental",
      "Travel",
    ];
    photoList = [AppAssets.imgProfile];
  }

  void _nextPage() {
    if (_currentPage < totalPages - 1) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
    } else {
      Navigator.push(context, DashboardScreen.route(currentIndex: 0));
    }
  }

  @override
  void initState() {
    super.initState();
    fillData();
    _currentPage = widget.currentIndex;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _pageController.jumpToPage(widget.currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScaffold,
      body: SafeArea(
        top: true,
        child: Column(
          children: [
            TopBar(
              this,
              isShowBack: true,
            ),
            Visibility(
              visible: !(_currentPage == 5),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 5.setHeight),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(totalPages, (index) {
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      height: 3.setHeight,
                      width: 52.setWidth,
                      decoration: BoxDecoration(
                        color: index <= _currentPage ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).btnPink,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 60.setHeight),
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) => setState(() => _currentPage = index),
                children: [
                  FirstNameView(),
                  DateOfBirthView(),
                  const GenderView(),
                  PassionView(passionList: passionList),
                  PhotoUploadView(photoList: photoList),
                  const FinalView(),
                ],
              ),
            ),
            IgnorePointer(
              ignoring: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.setWidth, vertical: 20.setHeight),
                child: CommonButton(
                  text:
                      _currentPage == totalPages - 1 ? Languages.of(context).txtStart.toUpperCase() : Languages.of(context).txtContinue.toUpperCase(),
                  onTap: _nextPage,
                ),
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
  }
}

class FirstNameView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  FirstNameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtWhatIsYourFirstName,
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 34.setHeight),
          CommonTextFormField(controller: _controller, hintText: Languages.of(context).txtEnterYourFirstName),
          SizedBox(height: 15.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
            child: CommonText(
              text: Languages.of(context).txtWhatIsYourFirstNameDesc,
              fontWeight: FontWeight.w400,
              fontSize: 14.setFontSize,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class DateOfBirthView extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  DateOfBirthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtWhatIsYourDateOfBirth,
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 34.setHeight),
          CommonTextFormField(controller: _controller, hintText: Languages.of(context).txtDDMMYY),
          SizedBox(height: 15.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.setWidth),
            child: CommonText(
              text: Languages.of(context).txtWhatIsYourDateOfBirthDesc,
              fontWeight: FontWeight.w400,
              fontSize: 14.setFontSize,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

enum Gender { male, female }

class GenderView extends StatefulWidget {
  const GenderView({super.key});

  @override
  GenderViewState createState() => GenderViewState();
}

class GenderViewState extends State<GenderView> {
  Gender? selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtWhatIsYourGender,
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 47.setHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildGenderOption(
                gender: Gender.male,
                label: Languages.of(context).txtAMan,
                isSelected: selectedGender == Gender.male,
                imagePath: AppAssets.icMan,
              ),
              Container(width: 1.setWidth, height: 213.setHeight, color: CustomAppColor.of(context).textFormFieldBorder),
              _buildGenderOption(
                gender: Gender.female,
                label: Languages.of(context).txtAWoman,
                isSelected: selectedGender == Gender.female,
                imagePath: AppAssets.icWomen,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildGenderOption({
    required Gender gender,
    required String label,
    required bool isSelected,
    required String imagePath,
  }) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedGender = gender;
        });
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            width: 67.setWidth,
            height: 127.setHeight,
            color: isSelected ? CustomAppColor.of(context).txtPink : const Color(0xFFF8E0F3).withValues(alpha: 0.50),
          ),
          SizedBox(height: 23.setHeight),
          CommonText(
            text: label,
            textColor: isSelected ? CustomAppColor.of(context).txtVelvetWhite : Colors.grey,
            fontWeight: FontWeight.w600,
            fontSize: 15.setFontSize,
          ),
        ],
      ),
    );
  }
}

class PassionView extends StatelessWidget {
  final List<String> passionList;
  PassionView({super.key, required this.passionList});

  final ValueNotifier<Set<String>> selectedPassion = ValueNotifier<Set<String>>({});

  @override
  Widget build(BuildContext context) {
    if (selectedPassion.value.isEmpty) {
      selectedPassion.value = {
        if (passionList.contains("Sport")) "Sport",
        if (passionList.contains("Art")) "Art",
        if (passionList.contains("Travel")) "Travel",
      };
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtPassions,
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
          ),
          SizedBox(height: 40.setHeight),
          ValueListenableBuilder<Set<String>>(
            valueListenable: selectedPassion,
            builder: (context, selectedValue, _) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 14.setWidth,
                runSpacing: 8.setHeight,
                children: passionList.map((item) {
                  bool isSelected = selectedValue.contains(item);
                  return GestureDetector(
                    onTap: () {
                      final newSelection = Set<String>.from(selectedValue);
                      if (isSelected) {
                        newSelection.remove(item);
                      } else {
                        newSelection.add(item);
                      }
                      selectedPassion.value = newSelection;
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 18.setWidth, vertical: 8.setHeight),
                      margin: EdgeInsets.only(bottom: 10.setHeight),
                      decoration: BoxDecoration(
                        color: isSelected ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: isSelected ? CustomAppColor.of(context).txtPink : CustomAppColor.of(context).bgButton,
                          width: 1,
                        ),
                      ),
                      child: CommonText(
                        text: item.toUpperCase(),
                        fontSize: 16.setFontSize,
                        fontWeight: FontWeight.w500,
                        textColor: isSelected ? CustomAppColor.of(context).white : CustomAppColor.of(context).txtVelvetPink,
                      ),
                    ),
                  );
                }).toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class PhotoUploadView extends StatelessWidget {
  final List<String> photoList;
  const PhotoUploadView({super.key, required this.photoList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
      child: Column(
        children: [
          CommonText(
            text: Languages.of(context).txtAddYourBestPhotosHere,
            fontSize: 24.setFontSize,
            fontWeight: FontWeight.w800,
            textColor: CustomAppColor.of(context).txtVelvet,
          ),
          SizedBox(height: 12.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.setWidth),
            child: CommonText(
              text: Languages.of(context).txtAddYourBestPhotosHereDesc,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtVelvet,
            ),
          ),
          SizedBox(height: 40.setHeight),
          SizedBox(
            height: 160.setHeight,
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10.setWidth),
              itemBuilder: (context, index) {
                bool hasImage = index < photoList.length;

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 100.setWidth,
                      height: 145.setHeight,
                      margin: EdgeInsets.only(right: 16.setWidth),
                      decoration: BoxDecoration(
                        color: CustomAppColor.of(context).imgBg,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: CustomAppColor.of(context).textFormFieldBorder),
                        image: hasImage
                            ? DecorationImage(
                                image: AssetImage(photoList[index]),
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                      child: !hasImage
                          ? Center(
                              child: Image.asset(
                                AppAssets.icUser,
                                height: 56.setHeight,
                                width: 56.setWidth,
                              ),
                            )
                          : null,
                    ),
                    if (!hasImage)
                      Positioned(
                        bottom: 0.setHeight,
                        left: 30.setWidth,
                        child: Container(
                          width: 40.setWidth,
                          height: 28.setWidth,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: CustomAppColor.of(context).txtPink,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 18.setWidth,
                            color: CustomAppColor.of(context).white,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ),
          SizedBox(height: 40.setHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
            child: CommonText(
              text: Languages.of(context).txtClickAndDragOnThePhotosToChangeTheOrder,
              fontSize: 14.setFontSize,
              fontWeight: FontWeight.w400,
              textColor: CustomAppColor.of(context).txtVelvet,
              maxLines: 4,
            ),
          ),
        ],
      ),
    );
  }
}

class FinalView extends StatelessWidget {
  const FinalView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                AppAssets.imgBgProfile,
                height: 317.setHeight,
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: CustomAppColor.of(context).txtPink,
                      width: 5,
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(100),
                    child: Image.asset(
                      AppAssets.imgProfile,
                      width: 131.setWidth,
                      height: 131.setHeight,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 10.setHeight),
          CommonText(
            text: Languages.of(context).txtNowLetPerfectThatProfileOfYours,
            fontWeight: FontWeight.w800,
            fontSize: 24.setFontSize,
          )
        ],
      ),
    );
  }
}
