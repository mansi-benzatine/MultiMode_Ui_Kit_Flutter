class FaqCategory {
  final String title;
  final List<FaqItem> items;

  FaqCategory({required this.title, required this.items});
}

class FaqItem {
  final String question;
  final String answer;

  FaqItem({required this.question, required this.answer});
}

class ContactItem {
  final String title;
  final String iconPath;

  ContactItem({required this.title, required this.iconPath});
}
