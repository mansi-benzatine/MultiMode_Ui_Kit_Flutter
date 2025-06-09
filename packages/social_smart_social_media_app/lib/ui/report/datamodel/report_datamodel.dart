import 'package:flutter/cupertino.dart';

import '../../../../../../../../../utils/string_constant.dart';

class Reason {
  final String label;

  Reason({required this.label});
}

List<Reason> reasons(BuildContext context) {
  return [
    Reason(label: AppStrings.dangerousOorganizationsIndividuals),
    Reason(label: AppStrings.fraudsAndScams),
    Reason(label: AppStrings.misleadingInformation),
    Reason(label: AppStrings.illegalActivitiesOrRegulatedGoods),
    Reason(label: AppStrings.violentAndGraphicContents),
    Reason(label: AppStrings.animalCruelty),
    Reason(label: AppStrings.pornographyAndNudity),
    Reason(label: AppStrings.hateSpeech),
    Reason(label: AppStrings.harrashmentOrBullying),
    Reason(label: AppStrings.intelectualPropertyInfringement),
    Reason(label: AppStrings.spam),
    Reason(label: AppStrings.minorSafety),
    Reason(label: AppStrings.other),
  ];
}
