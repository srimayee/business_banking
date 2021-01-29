import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class SideCashGetEnrollmentAdvertisementResponseModel extends Equatable implements JsonResponseModel{
  final String message;

  // TODO WHat is the protocol for enforcing required params on an API response,
  // right now my entity will throw an assertation error if null values exist
  SideCashGetEnrollmentAdvertisementResponseModel.fromJson(Map<String, dynamic> json)
    : this.message = json["message"]; // TODO DO we want to catch assertation errors here?


  @override
  List<Object> get props => [message];
}
