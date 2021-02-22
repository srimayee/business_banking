import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntityModelList extends Entity {
  /// Rest API Accounts Object.
  final List<CashAccountsEntityModel> cashAccountsEntityModelList;

  CashAccountsEntityModelList(
      {List<EntityError> errors = const [],
      List<CashAccountsEntityModel> cashAccountsServiceResponseModelList})
      :

        /// Set Default Values.
        cashAccountsEntityModelList =
            cashAccountsServiceResponseModelList ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, cashAccountsEntityModelList];

  @override
  merge({errors, List<CashAccountsEntityModel> cashAccountEntityModel}) {
    return CashAccountsEntityModelList(
      errors: errors ?? this.errors,
      cashAccountsServiceResponseModelList:
          cashAccountEntityModel ?? this.cashAccountsEntityModelList,
    );
  }

  @override
  String toString() {
    return 'CashAccountsEntityModelList{cashAccountsEntityModelList: $cashAccountsEntityModelList}';
  }
}
