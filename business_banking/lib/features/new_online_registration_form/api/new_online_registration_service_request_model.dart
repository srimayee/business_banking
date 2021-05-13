import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class NewOnlineRegistrationServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String? cardHolderName;
  final String? cardNumber;
  final String? email;
  final String? userPassword;

  NewOnlineRegistrationServiceRequestModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.email,
    required this.userPassword,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'cardHolderName': cardHolderName,
      'cardNumber': cardNumber,
      'email': email,
      'userPassword': userPassword,
    };
  }

  @override
  List<Object?> get props => [cardHolderName, cardNumber, email, userPassword];
}
