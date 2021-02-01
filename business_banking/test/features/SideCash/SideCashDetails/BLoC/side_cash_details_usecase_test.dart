import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_usecase.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock_dummy_functions.dart';

void main() {
  group('SideCashDetailsUsecase', () {
    test("will throw error if call back is null", () async {
      try {
        SideCashDetailsUsecase(null);
      } catch (e) {
        expect(e, isAssertionError);
      }
    });

    test("will execute the callback with proper view model ", () async {
      final mockDummyFunctions = MockDummyFunctions();
      final usecase = SideCashDetailsUsecase(mockDummyFunctions.voidCallBack);
      usecase.notifySubscribers(SideCashDetailsEntity());
      verify(mockDummyFunctions.voidCallBack(any)).called(1);
    });

    test("build View Model for service will return error model ", () async {
      final mockDummyFunctions = MockDummyFunctions();
      final usecase = SideCashDetailsUsecase(mockDummyFunctions.voidCallBack);
      final entity = SideCashDetailsEntity(errors: [EntityFailure()]);
      final result = usecase.buildViewModel(entity);
      expect(result, isA<SideCashDetailsViewModel>());
    });

    test("build View Model for service will return success accordingly ",
        () async {
      final mockDummyFunctions = MockDummyFunctions();
      final usecase = SideCashDetailsUsecase(mockDummyFunctions.voidCallBack);
      final entity = SideCashDetailsEntity();
      final result = usecase.buildViewModel(entity);
      expect(result, isA<SideCashDetailsViewModel>());
    });

    // test('Create method with scope will invoke callback', () {
    //   final mockFunctions = MockDummyFunctions();

    //   MockRepositoryScope _scope =
    //       ExampleLocator().repository.containsScope<SideCashDetailsEntity>();

    //   if (_scope == null) {
    //     final newSideCashDetailsEntity = SideCashDetailsEntity();
    //     _scope = MockExampleLocator().repository.create<SideCashDetailsEntity>(
    //         newSideCashDetailsEntity, mockFunctions.voidCallBack);
    //   }

    //   final useCase = SideCashDetailsUsecase(
    //     mockFunctions.voidCallBack,
    //     scope: _scope,
    //   );

    //   useCase.create();
    //   verify(mockFunctions.voidCallBack(any)).called(1);
    // });

    // test('Create method with NO scope will invoke callback', () {
    //   final mockFunctions = MockDummyFunctions();

    //   MockRepositoryScope _scope;

    //   final useCase = SideCashDetailsUsecase(
    //     mockFunctions.voidCallBack,
    //     scope: _scope,
    //   );

    //   useCase.create();
    //   verify(mockFunctions.voidCallBack(any)).called(1);
    // });

    test('SideCashDetailsUseCase initialize and create', () {
      final mockFunctions = MockDummyFunctions();

      final usecase = SideCashDetailsUsecase((viewModel) {
        expect(viewModel, isA<SideCashDetailsViewModel>());
      });
      usecase.create();
      verify(mockFunctions.voidCallBack(any)).called(1);
    });

    test('SideCashDetailsUseCase initialize and recreate', () {
      final mockFunctions = MockDummyFunctions();

      final usecase = SideCashDetailsUsecase((viewModel) {
        expect(viewModel, isA<SideCashDetailsViewModel>());
      });
      usecase.create();
      usecase.create(); //use to trigger else in the create
      verify(mockFunctions.voidCallBack(any)).called(1);
    });
  });
}
