enum Gender { male, female }

enum WeightUnit { kg, lbs }

enum HeightUnit { cm, ft }

enum UnitType { kg, lbs, cm, ft, km, mi }

class UserProfileInput {
  Gender? gender;
  int weight;
  int height;

  String weightUnit;
  String heightUnit;

  UserProfileInput({this.gender, this.weight = 60, this.height = 170, this.weightUnit = "KG", this.heightUnit = "CM"});
}
