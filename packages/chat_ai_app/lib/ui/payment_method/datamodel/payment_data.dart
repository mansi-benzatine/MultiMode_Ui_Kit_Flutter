class PaymentTypeData {
  final String paymentImageUrl;
  final String paymentType;
  bool isSelected;

  PaymentTypeData({
    required this.isSelected,
    required this.paymentImageUrl,
    required this.paymentType,
  });
}
