import 'dart:ui';

import 'package:clean_framework/clean_framework.dart';

class StockEntity extends Entity {
  final String? company;
  final String? symbol;
  final double? atClose;
  final double? shares;
  final double? value;

  StockEntity(
      {List<EntityFailure> errors = const [],
      this.company,
      this.symbol,
      this.atClose,
      this.shares,
      this.value});

  @override
  StockEntity merge(
      {errors,
      final String? company,
      final String? symbol,
      final double? atClose,
      final double? shares,
      final double? value}) {
    return StockEntity(
        company: company ?? this.company,
        symbol: symbol ?? this.symbol,
        atClose: atClose ?? this.atClose,
        shares: shares ?? this.shares,
        value: value ?? this.value);
  }
}
