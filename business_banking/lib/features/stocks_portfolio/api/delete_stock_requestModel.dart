import 'package:clean_framework/clean_framework_defaults.dart';

class DeleteStockRequestModel extends JsonRequestModel {
  DeleteStockRequestModel();

  @override
  Map<String, dynamic> toJson() {
    // Mock service just returns the list without the Nike stock.
    return {'company': 'Nike'};
  }
}
