import 'dart:math';

import 'package:business_banking/features/stocks/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  final bloc = StocksBloc();
  test('StocksBloc get correct view model', () {
    List<Map<String, dynamic>> stocksList = [
      {
        "company": "Amazon.com",
        "symbol": "AMZN",
        "at_close": 89.38,
        "shares": 100,
        "value": 8938.0
      }
    ];

    bloc.stocksViewModelPipe.receive.listen(expectAsync1((model) {
      expect(model, isA<StocksViewModel>());
      expect(model.stocksList, stocksList);
    }));
  });
}
