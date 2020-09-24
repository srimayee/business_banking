import 'package:business_banking/features/cash_accounts/api/cash_accounts_service_response_model.dart';
import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashAccountsListEntityModel extends Entity {
  /// Rest API Accounts Object.
  final List<CashAccountsEntityModel> cashAccountsEntityModel;

  CashAccountsListEntityModel(
      {List<EntityError> errors = const [],
        List<CashAccountsEntityModel> cashAccountsListServiceResponseModel})
      :
        cashAccountsEntityModel = cashAccountsListServiceResponseModel ?? [],
        /// Set Default Values.
        super(errors: errors);

  @override
  List<Object> get props => [errors, cashAccountsEntityModel];

  @override
  merge(
      {errors,
        List<CashAccountsEntityModel> cashAccountEntityModel}) {
    return CashAccountsListEntityModel(
      errors: errors ?? this.errors,
      cashAccountsListServiceResponseModel: cashAccountEntityModel ?? this.cashAccountsEntityModel,
    );
  }
}
