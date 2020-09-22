import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntity extends Entity {
  /// Rest API Accounts Object.
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String accountStatus;

  CashAccountsEntity(
      {

      /// Replicate object response.
      List<EntityError> errors = const [],
      String accountTitle,
      String accountNumber,
      double accountBalance,
      String accountStatus})
      :

        /// Set Default Values.
        this.accountTitle = accountTitle ?? 'Checking Account',
        this.accountNumber = accountNumber ?? '0000',
        this.accountBalance = accountBalance ?? 0.00,
        this.accountStatus = accountStatus ?? 'Active',
        super(errors: errors);

  @override
  List<Object> get props =>
      [errors, accountTitle, accountNumber, accountBalance, accountStatus];

  @override
  merge(
      {errors,
      String accountTitle,
      String accountNumber,
      double accountBalance,
      String accountStatus}) {
    return CashAccountsEntity(
      errors: errors ?? this.errors,
      accountTitle: accountTitle ?? this.accountTitle,
      accountNumber: accountNumber ?? this.accountNumber,
      accountBalance: accountBalance ?? this.accountBalance,
      accountStatus: accountStatus ?? this.accountStatus,
    );
  }

  @override
  String toString() {
    return "$accountTitle $accountNumber $accountBalance $accountStatus";
  }
}
