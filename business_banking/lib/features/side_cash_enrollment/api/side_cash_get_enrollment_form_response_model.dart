import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class SideCashGetEnrollmentFormResponseModel extends Equatable implements JsonResponseModel{
  final List<String> accounts;

  // TODO WHat is the protocol for enforcing required params on an API response,
  // right now my entity will throw an assertation error if null values exist
  SideCashGetEnrollmentFormResponseModel.fromJson(Map<String, dynamic> json)
      : assert(json['accounts'] != null), // TODO DO we want to catch assertation errors here?
        accounts = List<String>.from(json['accounts']);

  @override
  List<Object> get props => [accounts];
}
