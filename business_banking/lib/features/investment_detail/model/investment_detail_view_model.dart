import 'package:business_banking/features/investment_detail/model/investment_detail_model_list.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/cupertino.dart';

class InvestmentDetailViewModel extends ViewModel {
  final double accountBalance;
  final double totalGainValue;
  final double totalGainPercent;
  final List<InvestmentDetailModelList> investments;

  InvestmentDetailViewModel({
    @required this.accountBalance,
    @required this.totalGainValue,
    @required this.totalGainPercent,
    @required this.investments,
  });

  @override
  List<Object> get props =>
      [accountBalance, totalGainValue, totalGainPercent, investments];
}
