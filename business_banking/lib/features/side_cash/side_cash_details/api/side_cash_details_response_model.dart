import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class SideCashDetailsResponseModel extends Equatable
    implements JsonResponseModel {
  final String grossSideCashBalance;
  final String interest;
  final String paymentMin;
  final String remainingCredit;

  SideCashDetailsResponseModel.fromJson(Map<String, dynamic> json)
      : grossSideCashBalance = json['grossSideCashBalance'] ?? null,
        interest = json['interest'] ?? null,
        paymentMin = json['paymentMin'] ?? null,
        remainingCredit = json['remainingCredit'] ?? null;

  @override
  List<Object> get props => [
        grossSideCashBalance,
        interest,
        paymentMin,
        remainingCredit,
      ];
}
