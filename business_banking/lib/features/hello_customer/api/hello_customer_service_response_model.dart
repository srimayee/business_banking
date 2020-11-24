import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class HelloCustomerServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String honrsic;
  final String firstName;
  final String lastName;
  final String accountType;
  final String nickName;

  HelloCustomerServiceResponseModel.fromJson(Map<String, dynamic> json)
      : honrsic = json['honrsic'] ?? 'Mr.',
        firstName = json['firstName'] ?? "",
        lastName = json['lastName'] ?? "",
        accountType = json['accountType'] ?? "private",
        nickName = json['nickName'] ?? "";

  @override
  List<Object> get props => [honrsic, firstName, lastName, accountType, nickName];
}
