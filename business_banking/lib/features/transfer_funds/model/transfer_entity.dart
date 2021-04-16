import 'package:clean_framework/clean_framework.dart';

class TransferFundsEntity extends Entity {
  final String id;
  final String fromAccount;
  final String toAccount;
  final String amount;
  final DateTime date;
  final List<String> fromAccounts;
  final List<String> toAccounts;

  final lastMidnight =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  TransferFundsEntity(
      {List<EntityFailure> errors = const [],
      this.fromAccount = '',
      this.toAccount = '',
      this.amount = '',
      DateTime? date,
      List<String>? fromAccounts,
      List<String>? toAccounts,
      this.id = ''})
      : date = date ?? _getLastMidnight(),
        fromAccounts = fromAccounts ?? [fromAccount],
        toAccounts = toAccounts ?? [toAccount],
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        id,
        fromAccount,
        toAccount,
        amount,
        date,
        fromAccounts,
        toAccounts
      ];

  @override
  merge(
      {errors,
      String? id,
      String? fromAccount,
      String? toAccount,
      String? amount,
      DateTime? date,
      List<String>? fromAccounts,
      List<String>? toAccounts}) {
    return TransferFundsEntity(
        errors: errors ?? this.errors,
        id: id ?? this.id,
        fromAccount: fromAccount ?? this.fromAccount,
        toAccount: toAccount ?? this.toAccount,
        amount: amount ?? this.amount,
        date: date ?? this.date,
        fromAccounts: fromAccounts ?? this.fromAccounts,
        toAccounts: toAccounts ?? this.toAccounts);
  }

  static DateTime _getLastMidnight() {
    final now = DateTime.now();
    final lastMidnight = new DateTime(now.year, now.month, now.day);
    return lastMidnight;
  }
}
