import 'package:business_banking/features/budget/api/transactions_json_response_model.dart';
import 'package:business_banking/features/budget/api/transactions_service.dart';
import 'package:business_banking/features/budget/model/budget_entity.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';

class BudgetServiceAdapter extends ServiceAdapter<BudgetEntity,
    JsonRequestModel, TransactionsJsonResponseModel, TransactionsService> {
  BudgetServiceAdapter() : super(TransactionsService());

  @override
  BudgetEntity createEntity(BudgetEntity initialEntity,
          TransactionsJsonResponseModel responseModel) =>
      BudgetEntity(
          accountInfo: responseModel.accountInfo,
          allTransactions: responseModel.allTransactions);
}
