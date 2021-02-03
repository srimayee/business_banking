import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_usecase.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_entity.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mock_dummy_functions.dart';

void main() {
  group('SideCashDetailsUsecase', () {
    final mockFunctions = MockDummyFunctions();

    test("will throw error if call back is null", () async {
      try {
        SideCashDetailsUsecase(null);
      } catch (e) {
        expect(e, isAssertionError);
      }
    });

    test("will execute the callback with proper view model ", () async {
      final usecase = SideCashDetailsUsecase(mockFunctions.voidCallBack);
      usecase.notifySubscribers(SideCashDetailsEntity());
      verify(mockFunctions.voidCallBack(any)).called(1);
    });

    test("build View Model for service will return error model ", () async {
      final usecase = SideCashDetailsUsecase(mockFunctions.voidCallBack);
      final entity = SideCashDetailsEntity(errors: [EntityFailure()]);
      final result = usecase.buildViewModel(entity);
      expect(result, isA<SideCashDetailsViewModel>());
    });
    test("build View Model toggling details ", () async {
      final usecase = SideCashDetailsUsecase(mockFunctions.voidCallBack);
      // final entity = SideCashDetailsEntity(detailsOpen: true);
      usecase.create(); // make sure scope is set
      usecase.toggleDetailsDropdown(true);
      verify(mockFunctions.voidCallBack(any)).called(1);
    });

    test("build View Model for service will return success accordingly ",
        () async {
      final usecase = SideCashDetailsUsecase(mockFunctions.voidCallBack);
      final entity = SideCashDetailsEntity();
      final result = usecase.buildViewModel(entity);
      expect(result, isA<SideCashDetailsViewModel>());
    });
    test('SideCashDetailsUseCase initialize and create', () {
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
