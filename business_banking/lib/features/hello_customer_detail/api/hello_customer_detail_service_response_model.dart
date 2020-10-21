import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class HelloCustomerDetailServiceResponseModel extends Equatable
    implements JsonResponseModel {
  final String name;
  final String currentTimeString;

  HelloCustomerDetailServiceResponseModel.fromJson(Map<String, dynamic> json)
      : name = json['name'] ?? 'Name',
        currentTimeString = json['datetime'] ?? '00/00/00 00:00';

  @override
  List<Object> get props => [name, currentTimeString];
}
