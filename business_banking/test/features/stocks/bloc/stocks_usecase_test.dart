import 'package:business_banking/features/stocks/bloc/stocks_usecase.dart';
import 'package:business_banking/features/stocks/model/stocks_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main(){
  test('StocksUseCase initializes and calls create', () {
    final usecase = StocksUseCase((viewModel) {
      expect(viewModel, isA<StocksViewModel>());
      throw Error();
    });
    usecase.create();
  });
}