import 'package:clean_framework/clean_framework_defaults.dart';

class DepositCheckServiceRequestModel extends JsonRequestModel {
  final String accountNumber;
  final double depositAmount;
  final String frontCheckImg;
  final String backCheckImg;

  DepositCheckServiceRequestModel(
      {required this.accountNumber,
      required this.depositAmount,
      required this.frontCheckImg,
      required this.backCheckImg});

  @override
  Map<String, dynamic> toJson() {
    return {
      'accountNumber': accountNumber,
      'depositAmount': depositAmount.toString(),
      'frontCheckImg': frontCheckImg,
      'backCheckImg': backCheckImg
    };
  }
}
