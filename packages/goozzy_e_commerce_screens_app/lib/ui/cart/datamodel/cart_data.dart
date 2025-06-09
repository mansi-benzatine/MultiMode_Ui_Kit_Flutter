class PaymentModesData {
  final String leadingIcon;
  final String label;
  final bool? isSuffixIconSelect;
  final String? description;

  PaymentModesData({
    required this.leadingIcon,
    required this.label,
    this.isSuffixIconSelect,
    this.description,
  });
}
