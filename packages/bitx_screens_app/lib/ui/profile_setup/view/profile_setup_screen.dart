import 'package:bitx_screens_app/dialogs/alerts/congratulations_dialog.dart';
import 'package:bitx_screens_app/localization/language/languages.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/create_pin_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/digital_signature_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/select_country_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/select_gender_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/selfie_id_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/set_your_profile.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/terms_and_condition_page.dart';
import 'package:bitx_screens_app/ui/profile_setup/pages/upload_national_id_page.dart';
import 'package:bitx_screens_app/utils/app_assets.dart';
import 'package:bitx_screens_app/utils/utils.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../../../utils/sizer_utils.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../dashboard/view/dashboard_screen.dart';

class ProfileSetupScreen extends StatefulWidget {
  final int currentIndex;
  final bool forSuccessDialog;

  const ProfileSetupScreen({super.key, this.currentIndex = 0, this.forSuccessDialog = false});

  static Route<void> route({int currentIndex = 0, bool forSuccessDialog = false}) {
    return MaterialPageRoute(
      builder: (context) => ProfileSetupScreen(
        currentIndex: currentIndex,
        forSuccessDialog: forSuccessDialog,
      ),
    );
  }

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  late PageController pageController;

  final ValueNotifier<int> currentPage = ValueNotifier(1);

  final ValueNotifier<bool> isRetake = ValueNotifier(false);
  bool isSelfie = false;

  @override
  void initState() {
    pageController = PageController(initialPage: widget.currentIndex);
    currentPage.value = widget.currentIndex + 1;

    pageController.addListener(() {
      setState(() {});
    });
    super.initState();

    if (widget.forSuccessDialog) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) {
          showDialog(
            context: context,
            barrierColor: CustomAppColor.of(context).black.withOpacityPercent(0.3),
            builder: (dialogContext) {
              return PopScope(
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
                  onComplete: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const DashboardScreen()),
                    );
                  },
                ),
              );
            },
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Container(
        decoration: BoxDecoration(
          image: (Theme.of(context).brightness == Brightness.light)
              ? DecorationImage(
                  image: AssetImage(AppAssets.imgBgProfileSetup),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.setHeight),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.setWidth),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IgnorePointer(
                          ignoring: true,
                          child: GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Image.asset(
                              AppAssets.icBack,
                              height: 30.setHeight,
                              color: CustomAppColor.of(context).txtBlack,
                            ),
                          ),
                        ),
                        Expanded(child: progressIndicator(progress: 0.125)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: (int index) {
                        setState(() {
                          currentPage.value = index + 1;
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
                        const DigitalSignaturePage(),
                        const TermsAndConditionPage(),
                        const CreatePinPage(),
                      ],
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
                      color: currentPage.value == 2 ? CustomAppColor.of(context).bgScreen : CustomAppColor.of(context).transparent,
                      padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight, top: 5.setHeight),
                      child: IgnorePointer(
                        ignoring: true,
                        child: Row(
                          children: [
                            if (!value) ...[
                              Expanded(
                                child: CommonButton(
                                  text: "Back",
                                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                                  gradient: CustomAppColor.of(context).linearGradiant,
                                  onTap: () {
                                    pageController.previousPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeIn,
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                            ],
                            if (value) ...[
                              Expanded(
                                child: CommonButton(
                                  text: Languages.of(context).txtRetake,
                                  buttonTextColor: CustomAppColor.of(context).txtBlack,
                                  onTap: () {
                                    if (isSelfie) {
                                      SelfieIdPage.onRetakeClickListener?.onRetakeClick();
                                    } else {
                                      UploadNationalIdPage.onRetakeClickListener?.onRetakeClick();
                                    }
                                  },
                                  gradient: CustomAppColor.of(context).linearGradiant,
                                ),
                              ),
                              SizedBox(width: 10.setWidth),
                            ],
                            Expanded(
                              child: CommonButton(
                                text: Languages.of(context).txtContinue,
                                onTap: () {
                                  if (currentPage.value < 8) {
                                    isRetake.value = false;
                                    pageController.nextPage(
                                      duration: const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                    currentPage.value++;
                                  } else {
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
                              ),
                            ),
                          ],
                        ),
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

  Widget progressIndicator({required double progress}) {
    return Padding(
      padding: EdgeInsets.only(left: 20.setWidth),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topLeft,
        children: [
          Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.centerLeft,
            children: [
              Container(
                height: 12.setHeight,
                width: 0.screenWidth / 1.4,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  gradient: CustomAppColor.of(context).linearGradiant,
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.easeInOut,
                    height: 5.setHeight,
                    width: constraints.maxWidth / 1.2 * progress * currentPage.value,
                    margin: EdgeInsets.symmetric(horizontal: 5.setWidth),
                    decoration: BoxDecoration(
                      color: CustomAppColor.of(context).primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  );
                },
              ),
            ],
          ),
          Positioned(
            bottom: -20.setHeight,
            right: 0.setWidth,
            child: Container(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: CustomAppColor.of(context).linearGradiant,
              ),
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CustomAppColor.of(context).primary,
                ),
                child: CommonText(
                  text: '${(currentPage.value * progress * 100).toInt()}%',
                  fontSize: 10.setFontSize,
                  fontWeight: FontWeight.w600,
                  textColor: CustomAppColor.of(context).white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
