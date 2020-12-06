import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class MortgageServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final DateTime monthlyPaymentDue;
  final double monthlyAmountDue;
  final double outstandingPrincipal;
  final double interestRate;

  MortgageServiceResponseModel.fromJson(Map<String, dynamic> json)
      : monthlyPaymentDue =
            DateTime.fromMicrosecondsSinceEpoch(json['monthly_payment_due']) ??
                DateTime.now(),
        monthlyAmountDue = json['monthly_amount_due'] ?? 0.00,
        outstandingPrincipal = json['outstanding_principal'] ?? 0.00,
        interestRate = json['interest_rate'];
  @override
  List<Object> get props =>
      [monthlyPaymentDue, monthlyAmountDue, outstandingPrincipal, interestRate];
}
