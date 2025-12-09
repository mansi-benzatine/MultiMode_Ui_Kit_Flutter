import 'package:flowly_app/interfaces/top_bar_click_listener.dart';
import 'package:flowly_app/localization/language/languages.dart';
import 'package:flowly_app/utils/app_color.dart';
import 'package:flowly_app/utils/constant.dart';
import 'package:flowly_app/utils/sizer_utils.dart';
import 'package:flowly_app/widgets/button/common_button.dart';
import 'package:flowly_app/widgets/text_field/text_form_field.dart';
import 'package:flowly_app/widgets/top_bar/topbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/app_assets.dart';
import '../../../widgets/text/common_text.dart';
import '../../log_symptoms/datamodel/log_symptoms_data.dart';

class AddPillScreen extends StatefulWidget {
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const AddPillScreen());
  }

  const AddPillScreen({super.key});

  @override
  State<AddPillScreen> createState() => _AddPillScreenState();
}

class _AddPillScreenState extends State<AddPillScreen> implements TopBarClickListener {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController setTimeController = TextEditingController();
  final TextEditingController numberOfIntakesController = TextEditingController();
  ValueNotifier<bool> isReminder = ValueNotifier(false);
  late List<MedicineShape> shapes;
  MedicineShape? selectedShape;

  @override
  void initState() {
    super.initState();

    shapes = [
      MedicineShape(id: "shape1", icon: AppAssets.icMedicineRound),
      MedicineShape(id: "shape2", icon: AppAssets.icMedicineCapsule),
      MedicineShape(id: "shape3", icon: AppAssets.icMedicineRound),
      MedicineShape(id: "shape4", icon: AppAssets.icMedicineCapsule),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomAppColor.of(context).bgScreen,
      body: Column(
        children: [
          TopBar(
            this,
            title: Languages.of(context).txtAddPill,
            isShowBack: true,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
                child: Column(
                  children: [
                    CommonTextFormField(
                      controller: medicineNameController,
                      hintText: Languages.of(context).txtEnterYourMedicineName,
                      titleText: Languages.of(context).txtMedicineName,
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonTextFormField(
                      controller: medicineNameController,
                      hintText: Languages.of(context).txtEnterYourMedicineName,
                      titleText: Languages.of(context).txtMedicineName,
                    ),
                    SizedBox(height: 15.setHeight),
                    CommonTextFormField(
                      controller: medicineNameController,
                      hintText: Languages.of(context).txtEnterYourMedicineName,
                      titleText: Languages.of(context).txtMedicineName,
                    ),
                    SizedBox(height: 15.setHeight),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                          text: Languages.of(context).txtMedicineShape,
                          fontFamily: Constant.fontFamilyMulishSemiBold600,
                          fontSize: 14.setFontSize,
                        ),
                        SizedBox(height: 12.setHeight),
                        Row(
                          children: shapes.map((shape) {
                            return Padding(
                              padding: EdgeInsets.only(right: 12.setWidth),
                              child: MedicineShapeChip(
                                shape: shape,
                                selectedColor: const Color(0xFF2DB9C5),
                                onTap: () {
                                  setState(() {
                                    for (var s in shapes) {
                                      s.isSelected = false;
                                    }
                                    shape.isSelected = true;
                                    selectedShape = shape;
                                  });
                                },
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.setHeight),
                    Row(
                      children: [
                        ValueListenableBuilder<bool>(
                          valueListenable: isReminder,
                          builder: (context, value, child) {
                            return FlutterSwitch(
                              value: value,
                              onToggle: (bool newValue) {
                                setState(() {
                                  isReminder.value = newValue;
                                });
                              },
                              activeColor: CustomAppColor.of(context).primary,
                              inactiveColor: CustomAppColor.of(context).txtGray.withValues(alpha: 0.4),
                              activeToggleColor: CustomAppColor.of(context).white,
                              inactiveToggleColor: CustomAppColor.of(context).white,
                              width: 40.setWidth,
                              height: 22.setHeight,
                              toggleSize: 16.0,
                              borderRadius: 16.0,
                              padding: 2.5,
                            );
                          },
                        ),
                        SizedBox(width: 10.setWidth),
                        CommonText(
                          text: Languages.of(context).txtReminder,
                          fontFamily: Constant.fontFamilyMulishSemiBold600,
                        ),
                      ],
                    ),
                    SizedBox(height: 15.setHeight),
                    Row(
                      children: [
                        Container(
                          height: 5.setHeight,
                          width: 5.setWidth,
                          decoration: BoxDecoration(
                            color: CustomAppColor.of(context).txtGray,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6.setWidth),
                        CommonText(
                          text: Languages.of(context).txtPreviewReminderScreen,
                          fontSize: 12.setFontSize,
                          textColor: CustomAppColor.of(context).txtGray,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.setWidth),
            child: Row(
              children: [
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtCancel,
                    buttonColor: const Color(0xFFFFF4F4),
                    borderColor: const Color(0xFFFFF4F4),
                    buttonTextColor: CustomAppColor.of(context).txtPrimary,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(width: 12.setWidth),
                Expanded(
                  child: CommonButton(
                    text: Languages.of(context).txtSave,
                    onTap: () => Navigator.pop(context),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.setHeight)
        ],
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

class MedicineShapeChip extends StatelessWidget {
  final MedicineShape shape;
  final VoidCallback onTap;
  final Color selectedColor;

  const MedicineShapeChip({
    super.key,
    required this.shape,
    required this.onTap,
    required this.selectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: shape.isSelected ? selectedColor.withValues(alpha: 0.15) : CustomAppColor.of(context).bgScreen,
          border: Border.all(
            color: shape.isSelected ? selectedColor : CustomAppColor.of(context).txtGray.withValues(alpha: 0.2),
            width: 2,
          ),
        ),
        child: Image.asset(
          shape.icon,
          height: 20.setHeight,
          width: 20.setWidth,
        ),
      ),
    );
  }
}
