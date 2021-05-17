import 'package:clean_framework/clean_framework_defaults.dart';

class CreditCardPaymentResponseServiceRequestModel implements JsonRequestModel {
  final String number;
  final double paymentValue;

  CreditCardPaymentResponseServiceRequestModel(
      {required this.number, required this.paymentValue});

  @override
  Map<String, dynamic> toJson() {
    return {'number': number, 'paymentValue': paymentValue};
  }
}
