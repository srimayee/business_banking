//package
import 'package:clean_framework/clean_framework.dart';
import 'package:meta/meta.dart';
//internal
import 'investment_detail_model_list.dart';

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
