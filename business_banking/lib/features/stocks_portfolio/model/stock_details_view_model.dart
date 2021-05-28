import 'package:clean_framework/clean_framework.dart';

class StockDetailsViewModel extends ViewModel {
  final String company;
  final String symbol;
  final double value;
  final double atOpen;
  final double highValue;
  final double lowValue;
  final String volume;
  final List<Map<String, dynamic>> history;

  StockDetailsViewModel(
      {required this.company,
      required this.symbol,
      required this.value,
      required this.atOpen,
      required this.highValue,
      required this.lowValue,
      required this.volume,
      required this.history});

  @override
  List<Object?> get props =>
      [company, symbol, value, atOpen, highValue, lowValue, volume, history];
}
