import 'package:clean_framework/clean_framework.dart';

class StockViewModel extends ViewModel {
  final String? company;
  final String? symbol;
  final double? atClose;
  final double? shares;
  final double? value;

  StockViewModel(
      this.company, this.symbol, this.atClose, this.shares, this.value);

  @override
  List<Object?> get props => [company, symbol, atClose, shares, value];
}
