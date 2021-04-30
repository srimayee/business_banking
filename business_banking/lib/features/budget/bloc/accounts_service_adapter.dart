import 'package:business_banking/features/budget/api/accounts_json_response_model.dart';
import 'package:business_banking/features/budget/api/accounts_service.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class AccountsServiceAdapter extends ServiceAdapter<BudgetEntity,
    JsonRequestModel, AccountsJsonResponseModel, AccountsService> {
  AccountsServiceAdapter() : super(AccountsService());

  @override
  BudgetEntity createEntity(BudgetEntity initialEntity,
          AccountsJsonResponseModel responseModel) =>
      BudgetEntity(accounts: responseModel.accounts);
}
