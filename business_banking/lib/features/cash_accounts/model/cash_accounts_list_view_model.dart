import 'package:business_banking/features/cash_accounts/model/cash_accounts_entity.dart';
import 'package:clean_framework/clean_framework.dart';

class CashAccountsViewModelList extends ViewModel {
  final List<CashAccountsEntity> cashAccountEntityList;

  CashAccountsViewModelList({this.cashAccountEntityList});

  @override
  List<Object> get props => cashAccountEntityList;
}
