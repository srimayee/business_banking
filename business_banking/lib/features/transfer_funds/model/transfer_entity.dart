import 'package:clean_framework/clean_framework.dart';

class TransferFundsEntity extends Entity {
  final String id;
  final String fromAccount;
  final String toAccount;
  final double amount;
  final DateTime date;
  final List<String> fromAccounts;
  final List<String> toAccounts;

  TransferFundsEntity(
      {List<EntityError> errors = const [],
        String fromAccount,
        String toAccount,
        double amount = 0.00,
        DateTime date,
        List<String> fromAccounts,
        List<String> toAccounts,
        String id})
      : this.fromAccount = fromAccount,
        this.toAccount = toAccount,
        this.amount = amount,
        this.date = date ?? DateTime.now(),
        this.fromAccounts = fromAccounts,
        this.toAccounts = toAccounts,
        this.id = id;

  @override
  List<Object> get props => [
    errors, id, fromAccount, toAccount, amount, date, fromAccounts, toAccounts
  ];

  @override
  merge({errors, String id, String fromAccount, String toAccount, double amount, DateTime date, List<String> fromAccounts, List<String> toAccounts}) {
    return TransferFundsEntity(
        errors: errors ?? this.errors,
        id: id ?? this.id,
        fromAccount: fromAccount ?? this.fromAccount,
        toAccount: toAccount ?? this.toAccount,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        fromAccounts: fromAccounts ?? this.fromAccounts,
        toAccounts: toAccounts ?? this.toAccounts
    );
  }

  @override
  String toString() {
    return "$fromAccount $toAccount $amount $date $fromAccounts $toAccounts";
  }
}