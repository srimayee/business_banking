import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class NewOnlineRegistrationServiceRequestModel extends Equatable
    implements JsonRequestModel {
  final String? cardNumber;
  final String? cardHolderName;
  final String? email;
  final String? userPassword;

  NewOnlineRegistrationServiceRequestModel({
    required this.cardNumber,
    required this.cardHolderName,
    required this.email,
    required this.userPassword,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'cardNumber': cardNumber,
      'cardHolderName': cardHolderName,
      'email': email,
      'userPassword': userPassword,
    };
  }

  @override
  List<Object?> get props => [cardNumber, cardHolderName, email, userPassword];
}
