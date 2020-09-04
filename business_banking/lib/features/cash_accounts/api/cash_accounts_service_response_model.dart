import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CashAccountsServiceResponseModel extends Equatable
    implements JsonResponseModel {

  final String name;
  final String lastFour;
  final double balance;
  
  CashAccountsServiceResponseModel.fromJson(Map<String, dynamic> json)
  : name = json['name'] ?? 'Account',
    lastFour = json['lastFour'] ?? 0,
    balance = json['balance'] ?? 0.00;

  @override
  List<Object> get props => [];
}