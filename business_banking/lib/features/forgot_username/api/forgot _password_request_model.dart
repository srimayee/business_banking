import 'package:clean_framework/clean_framework_defaults.dart';

class ForgotPasswordServiceRequestModel extends JsonRequestModel {
  final String email;

  ForgotPasswordServiceRequestModel(
      {required this.email});

  @override
  Map<String, dynamic> toJson() {
    return {
      'email': email
    };
  }
}
