class GeneralIssuesData {
  final String issuesTitle;
  final String solution;
  bool isExpanded;

  GeneralIssuesData({
    required this.issuesTitle,
    required this.solution,
    this.isExpanded = false,
  });
}
