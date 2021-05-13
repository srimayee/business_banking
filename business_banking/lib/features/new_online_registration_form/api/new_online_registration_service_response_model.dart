import 'package:clean_framework/clean_framework_defaults.dart';

class NewOnlineRegistrationServiceResponseModel extends JsonResponseModel {
  final bool didSucceed;
  final String accountNumberGenerated;

  NewOnlineRegistrationServiceResponseModel.fromJson(Map<String, dynamic> json)
      : didSucceed = json['didSucceed'] ?? false,
        accountNumberGenerated = json['accountNumberGenerated'] ?? '';

  @override
  List<Object> get props => [didSucceed, accountNumberGenerated];
}
