import 'package:flowly_app/ui/home/datamodel/home_data.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/text/common_text.dart';
import 'package:flutter/material.dart';

class ExploreSelfCareScreen extends StatefulWidget {
  final SuggestedForYouModel selfCare;

  static Route<void> route({required SuggestedForYouModel selfCare}) {
    return MaterialPageRoute(builder: (_) => ExploreSelfCareScreen(selfCare: selfCare));
  }

  const ExploreSelfCareScreen({super.key, required this.selfCare});

  @override
  State<ExploreSelfCareScreen> createState() => _ExploreSelfCareScreenState();
}

class _ExploreSelfCareScreenState extends State<ExploreSelfCareScreen> {
  bool isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      widget.selfCare.imageName,
                      height: 260.setHeight,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    if (widget.selfCare.isVideo)
                      Container(
                        decoration: BoxDecoration(
                          color: CustomAppColor.of(context).primary,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: CustomAppColor.of(context).white,
                            width: 2,
                          ),
                        ),
                        padding: const EdgeInsets.all(5),
                        child: Icon(
                          Icons.play_arrow_rounded,
                          color: CustomAppColor.of(context).white,
                          size: 42,
                        ),
                      ),
                    if (widget.selfCare.isVideo)
                      Positioned(
                        bottom: 20.setHeight,
                        right: 20.setWidth,
                        child: Container(
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).black.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 8.setWidth, vertical: 4.setHeight),
                          child: CommonText(
                            text: widget.selfCare.duration.toString(),
                            fontSize: 10.setFontSize,
                            textColor: CustomAppColor.of(context).white,
                            fontFamily: Constant.fontFamilyMulishExtraBold800,
                          ),
                        ),
                      )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 20.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonText(
                        text: widget.selfCare.title,
                        fontSize: 18.setFontSize,
                        fontFamily: Constant.fontFamilyMulishExtraBold800,
                      ),
                      SizedBox(height: 14.setHeight),
                      const CommonText(
                        text: ""
                            "A girl's first period, or menarche, involves the experience of bleeding from the vagina, typically for 3–7 days, which may be preceded by cramps, bloating, mood swings, and acne. The first periods are often unpredictable in length and symptoms, and it is normal for menstrual cycles to be irregular for the first few years.",
                        textAlign: TextAlign.start,
                      ),
                      SizedBox(height: 10.setHeight),
                      _sectionTitle("What to expect"),
                      _sectionBody([
                        "Bleeding: Period blood can be red, brown, or pink, and it may range from light spotting to heavier bleeding",
                        "Symptoms: You might experience cramps, backaches, breast tenderness, bloating, acne, fatigue, or mood swings",
                        "Irregular cycles: It's normal for your cycle to be irregular for the first few years, meaning your periods might not happen at the same time each month.",
                      ]),
                      SizedBox(height: 10.setHeight),
                      _sectionTitle("How to prepare"),
                      _sectionBody([
                        "Gather supplies: Keep a small bag with pads, a change of underwear, and wipes in your backpack or purse so you're prepared if your period starts unexpectedly.",
                        "Know the basics: Learn about period products and how to use them, and understand that periods are a normal part of a girl's development.",
                        "Stay comfortable: Warm baths or heating pads, gentle exercise, and over-the-counter pain relievers like ibuprofen can help with cramps.",
                      ]),
                      SizedBox(height: 20.setHeight),
                      _sectionTitle("Emotional support"),
                      _sectionBody([
                        "Acknowledge your feelings: It's okay to feel surprised, excited, or even a bit anxious about your first period, as it's a significant life change.",
                        "Communicate with trusted adults: Talk to your mom, a school nurse, or another trusted adult about what you're experiencing.They can provide reassurance and practical advice.",
                        "Embrace it as a transition: View your period as a normal and healthy transition, similar to other puberty changes like breast development and growth.",
                      ]),
                      SizedBox(height: 20.setHeight),
                      _sectionTitle("When to see a doctor"),
                      _sectionBody([" While most first periods are normal, it's a good idea to talk to a doctor if you have concerns or if you haven't had a period by age 15."]),
                      SizedBox(height: 40.setHeight),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 50.setHeight,
            left: 20.setWidth,
            right: 20.setWidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    size: 22,
                    color: CustomAppColor.of(context).black,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isBookmarked = !isBookmarked;
                    });
                  },
                  child: Icon(
                    isBookmarked ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                    size: 28,
                    color: CustomAppColor.of(context).black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return CommonText(
      text: title,
      fontFamily: Constant.fontFamilyMulishExtraBold800,
      fontSize: 16.setFontSize,
    );
  }

  Widget _sectionBody(List<String> points) {
    return Padding(
      padding: EdgeInsets.only(top: 6.setHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((p) => bulletPoint(p)).toList(),
      ),
    );
  }

  Widget bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CommonText(text: "• "),
        Expanded(
          child: CommonText(
            text: text,
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
