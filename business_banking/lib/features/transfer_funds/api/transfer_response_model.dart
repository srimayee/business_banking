import 'package:clean_framework/clean_framework_defaults.dart';

class TransferFundsResponseModel extends JsonResponseModel {
  final bool didSucceed;
  final String confirmation;

  TransferFundsResponseModel.fromJson(Map<String, dynamic> json)
      : didSucceed = true,
        confirmation = json['confirmation'] ?? 'sucess';

  @override
  List<Object> get props => [didSucceed, confirmation];
}
