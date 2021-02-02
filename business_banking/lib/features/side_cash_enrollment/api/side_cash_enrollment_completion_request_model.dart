import 'package:clean_framework/clean_framework_defaults.dart';

class SideCashEnrollmentCompletionRequestModel extends JsonRequestModel {
  final String requestedAccount;

  SideCashEnrollmentCompletionRequestModel(this.requestedAccount);

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> requestMap = {};
    requestMap["requestedAccount"] = requestedAccount;
    return requestMap;
  }
}
