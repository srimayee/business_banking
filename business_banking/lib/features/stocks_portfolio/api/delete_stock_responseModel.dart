import 'package:clean_framework/clean_framework_defaults.dart';

class DeleteStockResponseModel extends JsonResponseModel {
  final List<Map<String, dynamic>> stocksList;

  DeleteStockResponseModel.fromJson(Map<String, dynamic> json)
      : stocksList = List.from(json["stocks"]);

  @override
  List<Object?> get props => [stocksList];
}
