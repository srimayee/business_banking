import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter/foundation.dart';

class SideCashEnrollmentCompletionResponseModel extends JsonResponseModel {
  final String message;
  final bool isSuccessful;

  SideCashEnrollmentCompletionResponseModel.fromJson(Map<String, dynamic> json)
      : assert(json["message"] != null && json["isSuccessful"] != null),
        message = json["message"],
        isSuccessful = json["isSuccessful"];

  @override
  List<Object> get props => [message, isSuccessful];
}
