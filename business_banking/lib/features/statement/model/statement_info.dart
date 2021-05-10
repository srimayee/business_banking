class StatementActivity {
  final String description;
  final String date;
  final double? additions;
  final double? subtractions;
  final double balance;

  StatementActivity(this.description, this.date, this.subtractions,
      this.additions, this.balance);

  StatementActivity.fromJson(Map<String, dynamic> json)
      : description = json['description'] ?? '',
        date = json['date'] ?? '',
        additions = json['additions'],
        subtractions = json['subtractions'],
        balance = json['balance'] ?? 0.0;
}
