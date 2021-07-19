import 'package:clean_framework/clean_framework_defaults.dart';

class ForgotPasswordServiceResponseModel extends JsonResponseModel {
  final bool didSucceed;
  final String status;

  ForgotPasswordServiceResponseModel.fromJson(Map<String, dynamic> json)
      : didSucceed = json['didSucceed'] ?? false,
        status = json['status'] ?? '';

  @override
  List<Object> get props => [didSucceed, status];
}
