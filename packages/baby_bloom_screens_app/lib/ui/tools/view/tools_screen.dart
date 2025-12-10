import 'package:baby_bloom_screens_app/interfaces/top_bar_click_listener.dart';
import 'package:baby_bloom_screens_app/localization/language/languages.dart';
import 'package:baby_bloom_screens_app/ui/3d_model/view/3d_model_screen.dart';
import 'package:baby_bloom_screens_app/ui/baby_names/view/baby_names_screen.dart';
import 'package:baby_bloom_screens_app/ui/contractions/views/contraction_screen.dart';
import 'package:baby_bloom_screens_app/ui/diet_chart/view/diet_chart_screen.dart';
import 'package:baby_bloom_screens_app/ui/faq/views/faq_screen.dart';
import 'package:baby_bloom_screens_app/ui/kick_counter/view/kick_counter_screen.dart';
import 'package:baby_bloom_screens_app/ui/my_weight/view/my_weight_screen.dart';
import 'package:baby_bloom_screens_app/ui/pill_reminder/view/pill_reminder_screen.dart';
import 'package:baby_bloom_screens_app/ui/size/view/size_screen.dart';
import 'package:baby_bloom_screens_app/ui/tools/datamodel/tools_data.dart';
import 'package:baby_bloom_screens_app/utils/app_assets.dart';
import 'package:baby_bloom_screens_app/utils/app_color.dart';
import 'package:baby_bloom_screens_app/utils/sizer_utils.dart';
import 'package:baby_bloom_screens_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../widgets/text/common_text.dart';
import '../../vaccination/view/vaccination_screen.dart';

class ToolsScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const ToolsScreen());
  }

  const ToolsScreen({super.key});

  @override
  State<ToolsScreen> createState() => _ToolsScreenState();
}

class _ToolsScreenState extends State<ToolsScreen> implements TopBarClickListener {
  List<ToolsData> toolsList = [];

  void _fillData() {
    toolsList = [
      ToolsData(
        toolName: "3D Model",
        toolImage: AppAssets.img3dModel,
        toolColor: const Color(0xFF837DDB),
        isUpgradePlan: true,
        widget: const ThreeDModelScreen(),
      ),
      ToolsData(
        toolName: "Pill Reminder",
        toolImage: AppAssets.imgPillReminder,
        widget: const PillReminderScreen(),
        toolColor: const Color(0xFF78B6FF),
      ),
      ToolsData(
        toolName: "My Weight",
        toolImage: AppAssets.imgWeight,
        widget: const MyWeightScreen(),
        toolColor: const Color(0xFFEC9091),
      ),
      ToolsData(
        toolName: "Diet Chart",
        toolImage: AppAssets.imgDietChart,
        toolColor: const Color(0xFF77C65B),
        widget: const DietChartScreen(),
        isUpgradePlan: true,
      ),
      ToolsData(
        toolName: "Kick Counter",
        toolImage: AppAssets.imgKickCount,
        toolColor: const Color(0xFFEDB723),
        widget: const KickCounterScreen(),
        isUpgradePlan: true,
      ),
      ToolsData(
        toolName: "Size",
        toolImage: AppAssets.imgSize,
        widget: const SizeScreen(),
        toolColor: const Color(0xFFE8789E),
      ),
      ToolsData(
        toolName: "Vaccination",
        toolImage: AppAssets.imgVaccination,
        toolColor: const Color(0xFF16A78F),
        widget: const VaccinationScreen(),
        isUpgradePlan: true,
      ),
      ToolsData(
        toolName: "Contractions",
        toolImage: AppAssets.imgContractions,
        toolColor: const Color(0xFFBED417),
        widget: const ContractionScreen(),
        isUpgradePlan: true,
      ),
      ToolsData(
        toolName: "Baby Names",
        toolImage: AppAssets.imgBabyNames,
        widget: const BabyNamesScreen(),
        toolColor: const Color(0xFFEF8B5A),
      ),
      ToolsData(
        toolName: "FAQ",
        toolImage: AppAssets.imgFaq,
        widget: const FaqScreen(),
        toolColor: const Color(0xFF768AED),
      ),
    ];
  }

  @override
  void initState() {
    super.initState();
    _fillData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtTools,
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(left: 20.setWidth, right: 20.setWidth, bottom: 20.setHeight),
              child: Wrap(
                spacing: 12,
                runSpacing: 16,
                children: toolsList.map((tool) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width - 20 * 3) / 2,
                    child: ToolCard(tool: tool),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void onTopBarClick(String name, {bool value = true}) {}
}

class ToolCard extends StatelessWidget {
  final ToolsData tool;

  const ToolCard({super.key, required this.tool});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: true,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => tool.widget,
            )),
        child: Container(
          height: 160.setHeight,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                tool.toolColor,
                CustomAppColor.of(context).white.withValues(alpha: 0.9),
              ],
              stops: const [0.0, 1],
              begin: Alignment.bottomRight,
              end: Alignment.topLeft,
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Stack(
              children: [
                Positioned(
                  bottom: -40,
                  right: -28,
                  child: CustomPaint(
                    size: const Size(155, 155),
                    painter: _InnerShadowCirclePainter(tool.toolColor),
                  ),
                ),
                Positioned(
                  bottom: -30,
                  right: -18,
                  child: Container(
                    width: 122.setWidth,
                    height: 120.setHeight,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          tool.toolColor.withValues(alpha: 0.9),
                          Colors.white.withValues(alpha: 0.9),
                        ],
                        stops: const [0.4, 0.9],
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft,
                      ),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.5),
                        width: 0.5,
                      ),
                      color: tool.toolColor.withValues(alpha: 0.6),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.setHeight,
                  right: 10.setWidth,
                  child: Image.asset(
                    tool.toolImage,
                    height: 100.setHeight,
                    width: 100.setHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 12.setHeight,
                  left: 12.setWidth,
                  right: 12.setWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                        text: tool.toolName,
                        fontFamily: Constant.fontFamilyBold700,
                        fontSize: 15.setFontSize,
                        textColor: CustomAppColor.of(context).black,
                      ),
                      if (tool.isUpgradePlan)
                        Image.asset(
                          AppAssets.icUpgrade,
                          width: 24.setWidth,
                          height: 24.setHeight,
                        ),
                    ],
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

class _InnerShadowCirclePainter extends CustomPainter {
  final Color color;

  _InnerShadowCirclePainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final outerPaint = Paint()
      ..shader = RadialGradient(
        colors: [
          color.withValues(alpha: 0.8),
          color,
        ],
        stops: const [0.0, 0.0],
      ).createShader(
        Rect.fromCircle(center: center, radius: radius),
      );

    canvas.drawCircle(center, radius, outerPaint);

    final shadowPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          color.withValues(alpha: 0.8),
          Colors.white,
        ],
        stops: const [0.0, 1],
        begin: Alignment.topLeft,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromCircle(center: center, radius: radius));

    canvas.drawCircle(center, radius, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant _InnerShadowCirclePainter oldDelegate) => oldDelegate.color != color;
}
