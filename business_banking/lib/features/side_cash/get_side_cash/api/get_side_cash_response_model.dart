import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:equatable/equatable.dart';

class GetSideCashResponseModel extends Equatable implements JsonResponseModel {
  final bool success;

  GetSideCashResponseModel.fromJson(Map<String, dynamic> json)
      : success = json['success'] ?? false;

  @override
  List<Object> get props => [success];
}
