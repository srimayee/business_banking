import 'package:clean_framework/clean_framework_defaults.dart';

class StockDetailsResponseModel extends JsonResponseModel {
  final String company;
  final String symbol;
  final double value;
  final double atOpen;
  final double highValue;
  final double lowValue;
  final String volume;
  final List<Map<String, dynamic>> history;

  StockDetailsResponseModel.fromJson(Map<String, dynamic> json)
      : company = json['company'],
        symbol = json['symbol'],
        value = json['value'],
        atOpen = json['at_open'],
        highValue = json['high_value'],
        lowValue = json['low_value'],
        volume = json['volume'],
        history = List.from(json['history']);

  List<Object?> get props =>
      [company, symbol, value, atOpen, highValue, lowValue, volume, history];
}
