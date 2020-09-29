import 'package:clean_framework/clean_framework.dart';

class MortgageAccountDetailEntity extends Entity {
  final String name;
  final String lastFour;
  final String accountType;
  final int routingNumber;
  final double balance;
  final double beginningBalance;
  final double pendingTransactions;
  final double depositHolds;

  MortgageAccountDetailEntity(
      {List<EntityError> errors = const [],
        String name,
        String lastFour,
        String accountType,
        int routingNumber,
        this.balance = 0.00,
        this.beginningBalance = 0.00,
        this.pendingTransactions = 0.00,
        this.depositHolds = 0.00})
      : name = name ?? 'Account',
        lastFour = lastFour ?? '0000',
        accountType = accountType ?? 'Account Checking',
        routingNumber = routingNumber ?? 000000000,
        super(errors: errors);

  @override
  List<Object> get props => [
    errors,
    name,
    lastFour,
    accountType,
    routingNumber,
    balance,
    beginningBalance,
    pendingTransactions,
    depositHolds
  ];

  @override
  merge(
      {errors,
        String name,
        String lastFour,
        String accountType,
        int routingNumber,
        double balance,
        double beginningBalance,
        double pendingTransactions,
        double depositHolds}) {
    return MortgageAccountDetailEntity(
        errors: errors ?? this.errors,
        name: name ?? this.name,
        lastFour: lastFour ?? this.lastFour,
        accountType: accountType ?? this.accountType,
        routingNumber: routingNumber ?? this.routingNumber,
        balance: balance ?? this.balance,
        beginningBalance: beginningBalance ?? this.beginningBalance,
        pendingTransactions: pendingTransactions ?? this.pendingTransactions,
        depositHolds: depositHolds ?? this.depositHolds);
  }

  @override
  String toString() {
    return '$name $lastFour $accountType $routingNumber $balance $beginningBalance $pendingTransactions $depositHolds';
  }
}
