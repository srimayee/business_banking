import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashAccountsEntityList extends Entity {
  /// Rest API Accounts Object.
  final List<CashAccountsEntity> cashAccountsEntityList;

  CashAccountsEntityList({
    List<EntityFailure> errors = const [],
    List<CashAccountsEntity> cashAccountsServiceResponseModelList,
  })  : cashAccountsEntityList = cashAccountsServiceResponseModelList ?? [],
        super(errors: errors);

  @override
  List<Object> get props => [errors, cashAccountsEntityList];

  @override
  merge({errors, List<CashAccountsEntity> cashAccountEntityModel}) {
    return CashAccountsEntityList(
      errors: errors ?? this.errors,
      cashAccountsServiceResponseModelList:
          cashAccountEntityModel ?? this.cashAccountsEntityList,
    );
  }
}
