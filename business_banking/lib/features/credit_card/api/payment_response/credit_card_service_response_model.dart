import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';


class CreditCardServiceResponseModel extends JsonResponseModel {
  final String number;
  final String name;
  final String lastFour;
  final double balance;
  final DateTime paymentDueDate;
  final DateTime nextClosingDate;
  final double paymentMinimumValue;
  final List<CreditCardTransaction> transactions;

  CreditCardServiceResponseModel.fromJson(Map<String, dynamic> json)
      : number = json['number'] ?? '',
        name = json['name'] ?? '',
        lastFour = json['lastFour'] ?? '',
        balance = json['balance'] ?? 0.00,
        paymentDueDate = json['paymentDueDate'] == null ? DateTime.fromMicrosecondsSinceEpoch(0) : DateTime.parse(json['paymentDueDate']),
        nextClosingDate = json['nextClosingDate'] == null ? DateTime.fromMicrosecondsSinceEpoch(0) : DateTime.parse(json['nextClosingDate']),
        paymentMinimumValue = json['paymentMinimumValue'] ?? 0.00,
        transactions = transactionsListFromJson(json['transactions']);

  @override
  List<Object> get props => [
        number,
        name,
        lastFour,
        balance,
        paymentDueDate,
        nextClosingDate,
        paymentMinimumValue,
        transactions.length,
      ];

  static List<CreditCardTransaction> transactionsListFromJson(List<dynamic>? json) {
    List<CreditCardTransaction> list = List<CreditCardTransaction>.empty(growable: true);
    if (json != null) {
      json.forEach((value) {
        list.add(CreditCardTransaction.fromJson(value));
      });
    }
    return list;
  }
}
