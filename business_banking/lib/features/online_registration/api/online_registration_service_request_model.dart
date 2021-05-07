import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class OnlineRegistrationServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String? cardNumber;
  final String? cardHolderName;
  final String? ssnLastFourDigits;
  final String? email;
  final String? userPassword;

  OnlineRegistrationServiceRequestModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.ssnLastFourDigits,
    required this.email,
    required this.userPassword,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'ssnLastFourDigits': ssnLastFourDigits,
      'email': email,
      'userPassword': userPassword,
    };
  }

  @override
  List<Object?> get props =>
      [cardNumber, cardHolderName, ssnLastFourDigits, email, userPassword];
}
