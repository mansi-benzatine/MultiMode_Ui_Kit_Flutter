import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/ui/profile_setup/views/congratulation_screen.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:flutter/material.dart';

import '../../../localization/language/languages.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_color.dart';
import '../../../utils/constant.dart';
import '../../../widgets/button/common_button.dart';
import '../../../widgets/text/common_text.dart';
import '../../../widgets/top_bar/topbar.dart';

class YourWeightScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const YourWeightScreen());
  }

  const YourWeightScreen({super.key});

  @override
  State<YourWeightScreen> createState() => _YourWeightScreenState();
}

class _YourWeightScreenState extends State<YourWeightScreen> implements TopBarClickListener {
  ValueNotifier<int> selectedWeight = ValueNotifier(75);
  late ScrollController _scrollController;
  final int minWeight = 30;
  final int maxWeight = 200;
  final double tickSpacing = 25.setWidth;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController(
      initialScrollOffset: (selectedWeight.value - minWeight) * tickSpacing,
    );
    selectedWeight.addListener(_onWeightChanged);
  }

  @override
  void dispose() {
    selectedWeight.removeListener(_onWeightChanged);
    _scrollController.dispose();
    super.dispose();
  }

  void _onWeightChanged() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        (selectedWeight.value - minWeight) * tickSpacing,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              AppAssets.imgProfileSetupBackground,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Column(
              children: [
                TopBar(
                  this,
                  title: Languages.of(context).txtYourWeight,
                  isShowBack: true,
                  appBarColor: CustomAppColor.of(context).transparent,
                ),
                Expanded(
                  child: _selectDateView(),
                ),
                IgnorePointer(
                  ignoring: true,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 30.setHeight),
                    child: CommonButton(
                      text: Languages.of(context).txtContinue,
                      onTap: () => Navigator.push(context, CongratulationScreen.route()),
                    ),
                  ),
                )
              ],
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

  Widget _selectDateView() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonText(
            text: Languages.of(context).txtYourWeightDesc,
            textColor: CustomAppColor.of(context).txtLightGrey,
            textAlign: TextAlign.start,
          ),
          SizedBox(height: 25.setHeight),
          SizedBox(
            height: 400.setHeight,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    AppAssets.icPregnantWomen,
                    height: 215.setHeight,
                    width: 120.setHeight,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 200,
                  right: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        AppAssets.imgWeightFrame,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 40.setWidth),
                        height: 160.setHeight,
                        child: Stack(
                          children: [
                            NotificationListener<ScrollNotification>(
                              onNotification: (ScrollNotification notification) {
                                if (notification is ScrollEndNotification) {
                                  final offset = _scrollController.offset;
                                  final weightIndex = (offset / tickSpacing).round();
                                  final newWeight = minWeight + weightIndex;
                                  if (newWeight >= minWeight && newWeight <= maxWeight) {
                                    selectedWeight.value = newWeight;
                                  }
                                }
                                return false;
                              },
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                controller: _scrollController,
                                physics: const ClampingScrollPhysics(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 3.3),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: List.generate(
                                      maxWeight - minWeight + 1,
                                      (index) {
                                        final weight = minWeight + index;
                                        final isMajorTick = weight % 10 == 0;
                                        final isMinorTick = weight % 2 == 0;

                                        return GestureDetector(
                                          onTap: () => selectedWeight.value = weight,
                                          child: SizedBox(
                                            width: tickSpacing,
                                            height: 140.setHeight,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                if (isMajorTick || isMinorTick) SizedBox(height: 25.setHeight),
                                                Container(
                                                  height: isMajorTick || isMinorTick ? 65.setHeight : 40.setHeight,
                                                  width: isMajorTick || isMinorTick ? 4.setWidth : 2.setWidth,
                                                  decoration: BoxDecoration(
                                                    color: CustomAppColor.of(context).txtLightGrey,
                                                    borderRadius: BorderRadius.circular(1000),
                                                  ),
                                                ),
                                                if (isMajorTick || isMinorTick) ...[
                                                  SizedBox(height: 10.setHeight),
                                                  CommonText(
                                                    text: weight.toString(),
                                                    fontSize: 15.setFontSize,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily: Constant.fontFamilyMedium500,
                                                    textAlign: TextAlign.center,
                                                    textColor: CustomAppColor.of(context).txtLightGrey,
                                                    height: 1,
                                                    isAutoSize: true,
                                                    maxLines: 1,
                                                  ),
                                                ],
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                height: 60.setHeight,
                                width: 3.setWidth,
                                decoration: BoxDecoration(
                                  color: CustomAppColor.of(context).red,
                                  borderRadius: BorderRadius.circular(1000),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 420.setHeight,
                  right: 0,
                  left: 0,
                  child: ValueListenableBuilder<int>(
                    valueListenable: selectedWeight,
                    builder: (context, weight, child) {
                      return Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonText(
                              text: weight.toString(),
                              fontSize: 55.setFontSize,
                              fontWeight: FontWeight.w700,
                              fontFamily: Constant.fontFamilyBold700,
                              textAlign: TextAlign.center,
                              textColor: CustomAppColor.of(context).txtBlack,
                              height: 1,
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 2.setHeight),
                              child: CommonText(
                                text: "kg",
                                fontSize: 50.setFontSize,
                                fontWeight: FontWeight.w400,
                                fontFamily: Constant.fontFamilyRegular400,
                                textAlign: TextAlign.center,
                                textColor: CustomAppColor.of(context).txtBlack,
                                height: 1,
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
        ],
      ),
    );
  }
}
