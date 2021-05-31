import 'package:clean_framework/clean_framework.dart';

class StockDetailsEntity extends Entity {
  final String company;
  final String symbol;
  final double value;
  final double atOpen;
  final double highValue;
  final double lowValue;
  final String volume;
  final List<Map<String, dynamic>> history;

  StockDetailsEntity({
    List<EntityFailure> errors = const [],
    String? company,
    String? symbol,
    double? value,
    double? atOpen,
    double? highValue,
    double? lowValue,
    String? volume,
    List<Map<String, dynamic>>? history,
  })  : company = company ?? "",
        symbol = symbol ?? "",
        value = value ?? 0.0,
        atOpen = atOpen ?? 0.0,
        highValue = highValue ?? 0.0,
        lowValue = lowValue ?? 0.0,
        volume = volume ?? "",
        history = history ?? [];

  @override
  StockDetailsEntity merge(
      {errors,
      String? company,
      String? symbol,
      double? value,
      double? atOpen,
      double? highValue,
      double? lowValue,
      String? volume,
      List<Map<String, dynamic>>? history}) {
    return StockDetailsEntity(
        company: company ?? this.company,
        symbol: symbol ?? this.symbol,
        value: value ?? this.value,
        atOpen: atOpen ?? this.atOpen,
        highValue: highValue ?? this.highValue,
        lowValue: lowValue ?? this.lowValue,
        volume: volume ?? this.volume,
        history: history ?? this.history);
  }

  @override
  List<Object> get props => [
        errors,
        company,
        symbol,
        value,
        atOpen,
        highValue,
        lowValue,
        volume,
        history
      ];
}
