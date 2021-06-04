// @dart=2.9
import 'package:business_banking/features/stocks_portfolio/bloc/delete_stock_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_bloc.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_list_usecase.dart';
import 'package:business_banking/features/stocks_portfolio/bloc/stocks_service_adapter.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_entity.dart';
import 'package:business_banking/features/stocks_portfolio/model/stocks_list_view_model.dart';
import 'package:business_banking/locator.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../mocks/repository_mocks.dart';

class MockStocksServiceAdapter extends Mock implements StocksServiceAdapter {}

class MockDeleteStockServiceAdapter extends Mock
    implements DeleteStockServiceAdapter {}

@GenerateMocks(
  [Repository, RepositoryScope, EventPipe],
)
main() {
  MockRepository mockRepository;
  StocksListUseCase usecase;
  MockStocksServiceAdapter mockStocksServiceAdapter;
  MockDeleteStockServiceAdapter mockDeleteStockServiceAdapter;
  group('StocksListUseCase', () {
    setUp(() {
      mockStocksServiceAdapter = MockStocksServiceAdapter();
      mockDeleteStockServiceAdapter = MockDeleteStockServiceAdapter();
      mockRepository = MockRepository();
      usecase = StocksListUseCase((_) {},
          repository: mockRepository,
          stocksServiceAdapter: mockStocksServiceAdapter,
          deleteStockServiceAdapter: mockDeleteStockServiceAdapter);
    });

    test('Test entity is created if scope is null', () async {
      mockRepository.mockEntity = StocksListEntity();
      mockRepository.scope = null;
      await usecase.getStocksList();
      verify(mockRepository.create(
              StocksListEntity(), usecase.notifySubscribers))
          .called(1);
      expect(mockRepository.scope, isNotNull);
      verify(mockRepository.runServiceAdapter(
              mockRepository.scope, mockStocksServiceAdapter))
          .called(1);
    });

    test('StocksListUsecase deleteStock called', () async {
      await usecase.getStocksList();
      await usecase.deleteStock(0);
      expect(mockRepository.scope, isNotNull);
      verify(mockRepository.runServiceAdapter(
              mockRepository.scope, mockDeleteStockServiceAdapter))
          .called(1);
    });
  });
}
