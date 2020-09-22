import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntity extends Entity {
  /// Rest API Accounts Object.
  final String accountType;
  final String accountTitle;
  final String accountNumber;
  final double accountBalance;
  final String accountStatus;

  CashAccountsEntity(
      {

      /// Replicate object response.
      List<EntityError> errors = const [],
      String accountType,
      String accountTitle,
      String accountNumber,
      double accountBalance,
      String accountStatus})
      :

        /// Set Default Values.
        this.accountType = accountType ?? "Cash",
        this.accountTitle = accountTitle ?? 'Checking Account',
        this.accountNumber = accountNumber ?? '0000',
        this.accountBalance = accountBalance ?? 0.00,
        this.accountStatus = accountStatus ?? 'Active',
        super(errors: errors);

  @override
  List<Object> get props => [
        errors,
        accountType,
        accountTitle,
        accountNumber,
        accountBalance,
        accountStatus
      ];

  @override
  merge({errors, String name, String lastFour, double balance}) {
    return CashAccountsEntity(
      errors: errors ?? this.errors,
      accountType: accountType ?? this.accountType,
      accountTitle: accountTitle ?? this.accountTitle,
      accountNumber: accountNumber ?? this.accountNumber,
      accountBalance: accountBalance ?? this.accountBalance,
      accountStatus: accountStatus ?? this.accountStatus,
    );
  }

  @override
  String toString() {
    return "$accountType $accountTitle $accountNumber $accountBalance $accountStatus";
  }
}
