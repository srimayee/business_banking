import 'package:clean_framework/clean_framework_defaults.dart';

class OnlineRegistrationServiceResponseModel extends JsonResponseModel {
  final bool didSucceed;

  OnlineRegistrationServiceResponseModel.fromJson(Map<String, dynamic> json)
      : didSucceed = true;

  @override
  List<Object> get props => [didSucceed];
}
