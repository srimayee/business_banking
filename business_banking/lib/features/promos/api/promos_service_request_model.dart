import 'package:clean_framework/clean_framework_defaults.dart';

class PromosServiceRequestModel extends JsonRequestModel {
  final String customerId;

  PromosServiceRequestModel({this.customerId});

  @override
  Map<String, dynamic> toJson() {
    return {"customerId": customerId};
  }
}
