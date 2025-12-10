import 'package:baby_bloom_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_app/utils/app_assets.dart';
import 'package:baby_bloom_app/utils/app_color.dart';
import 'package:baby_bloom_app/utils/constant.dart';
import 'package:baby_bloom_app/utils/sizer_utils.dart';
import 'package:baby_bloom_app/widgets/text/common_text.dart';
import 'package:baby_bloom_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

class ExploreDetailScreen extends StatefulWidget {
  final String title;
  static Route<void> route({String title = "Week 5-8"}) {
    return MaterialPageRoute(
      builder: (_) => ExploreDetailScreen(title: title),
    );
  }

  const ExploreDetailScreen({super.key, this.title = "Week 5-8"});

  @override
  State<ExploreDetailScreen> createState() => _ExploreDetailScreenState();
}

class _ExploreDetailScreenState extends State<ExploreDetailScreen> implements TopBarClickListener {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppAssets.imgProfileSetupBackground,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              TopBar(
                this,
                title: widget.title,
                isShowBack: true,
                appBarColor: CustomAppColor.of(context).transparent,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                child: Image.asset(
                  AppAssets.imgExploreWeek,
                  width: 259.setWidth,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.setWidth, vertical: 10.setHeight),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle("Pregnancy weeks 5–6"),
                      SizedBox(height: 8.setHeight),
                      _sectionDescription(
                        "The baby's central nervous system (brain and spinal cord) is rapidly developing from the neural tube, the heart is forming and may begin to beat, and limbs, eyes, and inner ears start to take shape, though the embryo is still very small.",
                      ),
                      SizedBox(height: 10.setHeight),
                      _sectionTitle("Baby’s Development"),
                      SizedBox(height: 8.setHeight),
                      _bulletList([
                        {"title": "Size", "desc": "The embryo is about the size of a sesame seed or lentil, growing quickly from approximately 2-5 mm"},
                        {"title": "Nervous System", "desc": "The neural tube, which will form the brain and spinal cord, begins to close."},
                        {"title": "Heart", "desc": "The heart starts to develop and may begin beating."},
                        {"title": "Organs", "desc": " The foundation for vital organs like the kidneys, liver, lungs, and digestive system are forming."},
                        {"title": "Limbs and Senses", "desc": "Small buds that will become the arms and legs appear. The optic vesicles (early eyes) and inner ear passageways begin to form"},
                        {"title": "Placenta and Umbilical Cord", "desc": "The placenta and umbilical cord are forming to provide the baby with nutrients and oxygen and connect the baby to the mother."},
                      ]),
                      SizedBox(height: 20.setHeight),
                      _sectionTitle("Mom’s Experiences"),
                      SizedBox(height: 8.setHeight),
                      _bulletList([
                        {"title": "Hormones", "desc": "Your body's levels are rising, influencing symptoms."},
                        {"title": "Fatigue", "desc": "You may feel very tired due to the demands of pregnancy"},
                        {"title": "Breasts", "desc": "Your breasts may feel tender, sore, tingly, or swollen"},
                        {"title": "Nausea", "desc": "Morning sickness, which can happen any time of day, might make you feel queasy"},
                        {"title": "Urination", "desc": "You may need to urinate more often than usual."},
                        {"title": "Cramping and Spotting", "desc": "Mild cramping and light spotting can occur and are usually normal."},
                      ]),
                      SizedBox(height: 20.setHeight),
                      _sectionTitle("What You Can Do"),
                      SizedBox(height: 8.setHeight),
                      _bulletList([
                        {"title": "Folic Acid", "desc": "Take 400 mcg of folic acid daily to help prevent like spina bifida"},
                        {"title": "Prenatal Care", "desc": "Schedule an appointment with your doctor or to start prenatal care"},
                        {"title": "Healthy Habits", "desc": "Eat a balanced diet, drink plenty of water, and consider moderate exercise like brisk walking."},
                        {"title": "Avoid Harmful Substances", "desc": "Limit or avoid alcohol, smoking, and caffeine."},
                      ]),
                      SizedBox(height: 40.setHeight),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return CommonText(
      text: "$title :",
      fontSize: 16.setFontSize,
      fontWeight: FontWeight.bold,
      textColor: CustomAppColor.of(context).txtBlack,
      textAlign: TextAlign.start,
    );
  }

  Widget _sectionDescription(String text) {
    return CommonText(
      text: text,
      fontSize: 13.setFontSize,
      height: 1.5,
      textAlign: TextAlign.start,
      textColor: CustomAppColor.of(context).txtLightGrey,
    );
  }

  Widget _bulletList(List<Map<String, String>> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map(
        (item) {
          return Padding(
            padding: EdgeInsets.only(bottom: 5.setHeight),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                  text: "• ",
                  fontSize: 14.setFontSize,
                  textColor: CustomAppColor.of(context).txtBlack,
                  height: 1.5,
                  textAlign: TextAlign.start,
                ),
                Expanded(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            children: [
                              if (item['title']?.isNotEmpty ?? false)
                                TextSpan(
                                  text: "${item['title']}: ",
                                  style: TextStyle(
                                    package: 'baby_bloom_app',
                                    fontSize: 13.setFontSize,
                                    height: 1.5,
                                    fontFamily: Constant.fontFamilySemiBold600,
                                    color: CustomAppColor.of(context).txtBlack,
                                  ),
                                ),
                              if (item['desc']?.isNotEmpty ?? false)
                                TextSpan(
                                  text: item['desc'],
                                  style: TextStyle(
                                    package: 'baby_bloom_app',
                                    fontSize: 13.setFontSize,
                                    height: 1.5,
                                    fontFamily: Constant.fontFamilyRegular400,
                                    color: CustomAppColor.of(context).txtLightGrey,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ).toList(),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {
    if (name == Constant.strBack) {
      Navigator.pop(context);
    }
  }
}
