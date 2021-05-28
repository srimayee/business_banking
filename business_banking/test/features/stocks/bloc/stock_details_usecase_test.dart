import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {
  test('StockDetailsUsecase initializes and calls create', () {
    final usecase = StockDetailsUseCase((viewModel) {
      expect(viewModel, isA<StockDetailsViewModel>());
      throw Error();
    });
    usecase.create();
  });
}
