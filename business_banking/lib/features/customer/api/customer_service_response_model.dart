import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class CustomerServiceResponseModel extends JsonResponseModel {
  final String honorific;
  final String firstName;
  final String lastName;
  final String accountType;
  final String nickName;
  final String address;

  CustomerServiceResponseModel.fromJson(Map<String, dynamic> json)
      : honorific = json['honorific'] ?? 'Mr.',
        firstName = json['firstName'] ?? "",
        lastName = json['lastName'] ?? "",
        accountType = json['accountType'] ?? "private",
        nickName = json['nickName'] ?? "",
        address = json['address'] ?? "";

  @override
  List<Object> get props =>
      [honorific, firstName, lastName, accountType, nickName, address];
}
