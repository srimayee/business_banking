import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashAccountsViewModelList extends ViewModel {
  final List<CashAccountsEntityModel> cashAccountEntityModel;

  CashAccountsViewModelList({this.cashAccountEntityModel});

  @override
  String toString() {
    return cashAccountEntityModel.toString();
  }
}