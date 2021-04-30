import 'package:clean_framework/clean_framework_defaults.dart';


class CreditCardPaymentResponseServiceResponseModel extends JsonResponseModel {
  final String number;
  final String name;
  final String lastFour;
  final double paymentValue;
  final String paymentStatus;
  final String reasonRejected;

  CreditCardPaymentResponseServiceResponseModel.fromJson(Map<String, dynamic> json)
      : number = json['number'] ?? '',
        name = json['name'] ?? '',
        lastFour = json['lastFour'] ?? '',
        paymentValue = json['paymentValue'] ?? 0.00,
        paymentStatus = json['paymentStatus'] ?? '',
        reasonRejected = json['reasonRejected'] ?? '';

  @override
  List<Object> get props => [
        number,
        name,
        lastFour,
        paymentValue,
        paymentStatus,
        reasonRejected,
      ];
}
