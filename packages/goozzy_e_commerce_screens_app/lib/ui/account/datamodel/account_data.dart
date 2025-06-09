class AccountData {
  final String leadingIcon;
  final String label;
  final bool? isSuffixIcon;
  final bool? isNavigate;

  AccountData({
    required this.leadingIcon,
    required this.label,
    this.isSuffixIcon,
    this.isNavigate,
  });
}
