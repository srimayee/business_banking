import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsRequestModel extends JsonRequestModel {
  final String stockName;

  StockDetailsRequestModel(this.stockName);

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {'stockName': stockName};
    return data;
  }
}
