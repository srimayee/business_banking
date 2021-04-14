import 'package:business_banking/features/budget/model/posted_transactions.dart';
import 'package:clean_framework/clean_framework.dart';

import 'account_info.dart';

class BudgetEntity extends Entity {
  final AccountInfo accountInfo;
  final List<PostedTransactions> allTransactions;

  BudgetEntity(
      {List<EntityFailure> errors = const [],
      List<PostedTransactions> allTransactions,
      AccountInfo accountInfo})
      : accountInfo = accountInfo ?? null,
        allTransactions = allTransactions ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, accountInfo, allTransactions];

  @override
  BudgetEntity merge({
    errors,
    AccountInfo accountInfo,
    List<PostedTransactions> allTransactions,
  }) {
    return BudgetEntity(
      errors: errors ?? this.errors,
      accountInfo: accountInfo ?? this.accountInfo,
      allTransactions: allTransactions ?? this.allTransactions,
    );
  }
}
