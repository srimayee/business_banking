import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class HelloLandingServiceResponseModel extends Equatable
    implements JsonResponseModel {

  HelloLandingServiceResponseModel.fromJson(Map<String, dynamic> json);

  @override
  List<Object> get props => [];
}