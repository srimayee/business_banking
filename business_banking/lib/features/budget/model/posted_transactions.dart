class PostedTransactions {
  final String transactionDate;
  final String description;
  final double debitAmount;
  final String category;
  final String cardNumber;

  PostedTransactions(this.transactionDate, this.description, this.debitAmount,
      this.category, this.cardNumber);

  PostedTransactions.fromJson(Map<String, dynamic> json)
      : transactionDate = json['transactionDate'] ?? '',
        description = json['description'] ?? '',
        debitAmount = json['debitAmount'] ?? 0.0,
        category = json['category'] ?? '',
        cardNumber = json['cardNumber'] ?? '';
}
