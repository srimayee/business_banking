// @dart=2.9
import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stock_details_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stock_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../mocks/repository_mocks.dart';

class MockStockDetailsServiceAdapter extends Mock
    implements StockDetailsServiceAdapter {}

class MockStockDetailsEntity extends Mock implements StockDetailsEntity {}

void main() {
  MockRepository mockRepository;
  StockDetailsUseCase useCase;
  MockStockDetailsServiceAdapter mockStockDetailsServiceAdapter;

  group('StockDetailsUseCase', () {
    setUp(() {
      mockStockDetailsServiceAdapter = MockStockDetailsServiceAdapter();
      mockRepository = MockRepository();
      useCase = StockDetailsUseCase((_) {},
          repository: mockRepository,
          stockDetailsServiceAdapter: mockStockDetailsServiceAdapter);
    });

    test('StocksUseCase initializes and returns a StockDetailsViewModel', () {
      final usecase = StockDetailsUseCase((viewModel) {
        expect(viewModel, isA<StockDetailsViewModel>());
      });
      usecase.getStockDetails();
    });

    // test('Test entity is created if scope is null', () async {
    //   mockRepository.mockEntity = StockDetailsEntity();
    //   // mockRepository.scope = null;
    //   await useCase.getStockDetails();
    //   verify(mockRepository.create(
    //           StockDetailsEntity(), useCase.notifySubscribers))
    //       .called(1);
    //   expect(mockRepository.scope, isNotNull);
    //   verify(mockRepository.runServiceAdapter(
    //           mockRepository.scope, mockStockDetailsServiceAdapter))
    //       .called(1);
    // });

    // test('Test notifySubscribers called if scope is not null', () async {
    //   mockRepository.mockEntity = StockDetailsEntity();
    //   mockRepository.scope = MockRepositoryScope();
    //   verify(useCase.notifySubscribers(MockStockDetailsEntity())).called(1);
    // });

    test(
        'Test that companyName property is set when showStockDetails is called',
        () async {
      // await useCase.getStockDetails();
      mockRepository.scope = MockRepositoryScope();
      await useCase.showStockDetails('name');
      expect(useCase.companyName, 'name');
    });
  });
}
