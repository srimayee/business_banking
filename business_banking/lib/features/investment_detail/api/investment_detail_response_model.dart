// package
import 'package:clean_framework/clean_framework_defaults.dart';
// internal
import '../model/investment_detail_model_list.dart';

class InvestmentDetailServiceResponseModel extends JsonResponseModel {
  double accountBalance;
  double totalGainValue;
  double totalGainPercent;
  List<InvestmentDetailModelList> investments;

  InvestmentDetailServiceResponseModel(
      {this.accountBalance,
      this.totalGainValue,
      this.totalGainPercent,
      this.investments});

  factory InvestmentDetailServiceResponseModel.fromJson(
      Map<String, dynamic> json) {
    List<InvestmentDetailModelList> _investments = [];
    json['investments'].forEach((item) {
      _investments.add(InvestmentDetailModelList.fromJson(item));
    });
    return InvestmentDetailServiceResponseModel(
        accountBalance: json['accountBalance'] ?? 0.00,
        totalGainValue: json['totalGainValue'] ?? 0.00,
        totalGainPercent: json['totalGainPercent'] ?? 0.00,
        investments: _investments);
  }

  @override
  List<Object> get props => [accountBalance, totalGainValue, totalGainPercent];
}
