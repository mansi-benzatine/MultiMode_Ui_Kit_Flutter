class SubscriptionData {
  final String icon;
  final String title;
  final String description;

  SubscriptionData({required this.icon, required this.description, required this.title});
}

class SubscriptionPlan {
  final String title;
  final String duration;
  final String price;

  SubscriptionPlan({required this.title, required this.duration, required this.price});
}
