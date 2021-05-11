class Bill {
  final int id;
  final String payee;
  final String memo;
  final double amount;
  final DateTime due;

  Bill(this.id, this.payee, this.memo,
      this.amount, this.due);

  Bill.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? 0,
        payee = json['payee'] ?? 'Unknown',
        memo = json['memo'] ?? '',
        amount = (json['amount'] != null) ? json['amount'] * 1.0 : 0.0,
        due = DateTime.fromMillisecondsSinceEpoch(json['due']
            ?? DateTime.now().millisecondsSinceEpoch);
}
