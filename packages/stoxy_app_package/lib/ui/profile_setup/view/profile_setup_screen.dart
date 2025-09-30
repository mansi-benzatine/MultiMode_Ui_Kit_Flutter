import 'package:flutter/material.dart';
import 'package:stoxy_app_package/dialogs/alerts/congratulations_dialog.dart';
import 'package:stoxy_app_package/localization/language/languages.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/create_pin_page.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/select_country_page.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/select_gender_page.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/selfie_id_page.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/set_your_profile.dart';
import 'package:stoxy_app_package/ui/profile_setup/pages/upload_national_id_page.dart';
import 'package:stoxy_app_package/utils/app_assets.dart';
import 'package:stoxy_app_package/utils/constant.dart';
import 'package:stoxy_app_package/utils/utils.dart';

import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  PageController pageController = PageController();

  final ValueNotifier<int> currentPage = ValueNotifier(0);

  final int stepperLenght = 6;

  final ValueNotifier<bool> isRetake = ValueNotifier(false);
  bool isSelfie = false;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.imgCommonBackground),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.setHeight),

                  // Header with back button and skip
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Image.asset(
                            AppAssets.icBack,
                            height: 30.setHeight,
                            color: CustomAppColor.of(context).txtBlack,
                          ),
                        ),
                        Expanded(
                          child: _stepperIndicator(),
                        ),
                        SizedBox(width: 20.setWidth),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.setHeight),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                      child: PageView(
                        controller: pageController,
                        onPageChanged: (int index) {
                          setState(() {
                            currentPage.value = index;
                          });
                        },
                        children: [
                          const SelectGenderPage(),
                          const SelectCountryPage(),
                          const SetYourProfile(),
                          UploadNationalIdPage(
                            onRetakeShow: (bool value) {
                              isRetake.value = value;
                              isSelfie = false;
                            },
                          ),
                          SelfieIdPage(
                            onRetakeShow: (bool value) {
                              isRetake.value = value;
                              isSelfie = true;
                            },
                          ),
                          const CreatePinPage(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0.setHeight,
                left: 0.setWidth,
                right: 0.setWidth,
                child: ValueListenableBuilder(
                  valueListenable: isRetake,
                  builder: (context, value, child) {
                    return Container(
                      color: currentPage.value == 1 ? CustomAppColor.of(context).bgScreen : CustomAppColor.of(context).transparent,
                      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight, top: 5.setHeight),
                      child: Row(
                        children: [
                          if (value) ...[
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtRetake,
                                buttonColor: CustomAppColor.of(context).transparent,
                                buttonTextColor: CustomAppColor.of(context).txtGray,
                                borderColor: CustomAppColor.of(context).borderTextFormFeild,
                                onTap: () {
                                  if (isSelfie) {
                                    SelfieIdPage.onRetakeClickListener?.onRetakeClick();
                                  } else {
                                    UploadNationalIdPage.onRetakeClickListener?.onRetakeClick();
                                  }
                                },
                              ),
                            ),
                            SizedBox(width: 10.setWidth),
                          ],
                          Expanded(
                            child: CommonButton(
                              text: Languages.of(context).txtContinue,
                              onTap: () {
                                if (currentPage.value < 5) {
                                  isRetake.value = false;
                                  pageController.nextPage(
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeInOut,
                                  );
                                  currentPage.value++;
                                } else {
                                  // Handle last page
                                  showDialog(
                                    context: context,
                                    barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
                                    builder: (context) => CongratulationsDialog(
                                      title: Languages.of(context).txtCongratulations,
                                      message: Languages.of(context).txtYourAccountIsReadyToUse,
                                      onComplete: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => const DashboardScreen()),
                                        );
                                      },
                                    ),
                                  );
                                }
                              },
                              gradient: CustomAppColor.of(context).primaryGradient,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _stepperIndicator() {
    return ValueListenableBuilder(
      valueListenable: currentPage,
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            stepperLenght,
            (index) => Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: value >= index ? CustomAppColor.of(context).primaryGradient : null,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: value >= index ? CustomAppColor.of(context).primary : CustomAppColor.of(context).primary,
                      width: 0.8,
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: CommonText(
                      text: (index + 1).toString(),
                      fontSize: 12.setFontSize,
                      fontFamily: value >= index ? Constant.fontFamily : Constant.fontFamilyMedium,
                      fontWeight: value >= index ? FontWeight.w700 : FontWeight.w500,
                      textColor: value >= index ? CustomAppColor.of(context).txtWhite : CustomAppColor.of(context).primary,
                    ),
                  ),
                ),
                if (index != stepperLenght - 1)
                  Container(
                    decoration: BoxDecoration(
                      gradient: value >= index
                          ? CustomAppColor.of(context).primaryGradient
                          : LinearGradient(colors: [
                              CustomAppColor.of(context).primary,
                              CustomAppColor.of(context).primary,
                            ]),
                    ),
                    width: 18.setWidth,
                    height: value >= index ? 2.5.setHeight : 0.5.setHeight,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
