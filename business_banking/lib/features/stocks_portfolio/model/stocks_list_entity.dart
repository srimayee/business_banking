import 'package:clean_framework/clean_framework.dart';

class StocksListEntity extends Entity {
  final List<Map<String, dynamic>> stocks;

  StocksListEntity(
      {List<EntityFailure> errors = const [],
      List<Map<String, dynamic>>? stocks})
      : this.stocks = stocks ?? [];

  @override
  List<Object> get props => [errors, stocks];

  @override
  StocksListEntity merge({errors, List<Map<String, dynamic>>? stocks}) {
    return StocksListEntity(
      errors: errors ?? this.errors,
      stocks: stocks ?? this.stocks,
    );
  }
}
