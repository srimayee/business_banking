import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class RequestMoneyServiceResponseModel extends JsonResponseModel{
  final String name;
  final String email;
  final String imageUrl;
  final double amount;
  final String memo;

  RequestMoneyServiceResponseModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Username',
        email = json['email'] ?? 'username@gmail.com',
        imageUrl = json['imageUrl'] ?? '',
        amount = json['amount'] ?? 0,
        memo = json['memo'] ?? 'this is a memo';

  @override
  List<Object> get props => [name, email, imageUrl, amount, memo];
}