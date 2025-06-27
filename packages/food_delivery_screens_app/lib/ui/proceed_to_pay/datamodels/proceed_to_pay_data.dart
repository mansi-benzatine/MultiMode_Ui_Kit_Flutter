class WalletsData {
  final String walletName;
  final String walletImageUrl;
  bool isSelected;
  final String? walletCardNumber;

  WalletsData({
    required this.walletImageUrl,
    required this.walletName,
    this.isSelected = false,
    this.walletCardNumber,
  });
}
