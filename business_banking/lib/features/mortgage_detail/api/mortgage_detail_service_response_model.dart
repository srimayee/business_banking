import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class MortgageDetailServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final double escrowBalance;
  final double feesCharged;
  final int loanNumber;

  MortgageDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
      : escrowBalance = json['escrow_balance'],
        feesCharged = json['fees_charged'],
        loanNumber = json['loan_number'];

  @override
  List<Object> get props => [escrowBalance, feesCharged, loanNumber];
}
