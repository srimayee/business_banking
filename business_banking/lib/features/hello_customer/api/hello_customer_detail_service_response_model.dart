import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class HelloCustomerDetailServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String honrsic;
  final String firstName;
  final String lastName;
  final String weather;
  final String address;

  HelloCustomerDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
      : honrsic = json['honrsic'] ?? 'Mr.',
        firstName = json['firstName'] ?? "",
        lastName = json['lastName'] ?? "",
        weather = json['weather'] ?? "",
        address = json['address'] ?? "";

  @override
  List<Object> get props => [honrsic, firstName, lastName, weather, address];
}
