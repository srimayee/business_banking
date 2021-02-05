import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:clean_framework/clean_framework_defaults.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('GetSideCashUseCase initialize with error', () {
    try {
      GetSideCashUsecase(null);
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });

  test('GetSideCashUseCase initialize and create', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });
    usecase.create();
  });

  test('GetSideCashUseCase initialize and recreate', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });
    usecase.create();
    usecase.create();
  });
  test('GetSideCashUseCase submit function', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });
    usecase.create();
    usecase.submitGetSideCash('12.34');
  });
  test('GetSideCashUseCase submit function with empty input', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });
    usecase.create();
    usecase.resetAll();
    usecase.submitGetSideCash('12.34');
  });
  test('GetSideCashUseCase reset function', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });
    usecase.create();
    final GetSideCashEntity updated = usecase.resetAll();
    expect(
      updated,
      GetSideCashEntity(
        amountRequested: '',
        badStringError: null,
        errors: null,
        failError: null,
        requestSuccess: false,
      ),
    );
  });
  test('GetSideCashUseCase success function', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });

    usecase.submitGetSideCash('12.34');
  });
  test('GetSideCashUseCase buildViewModelForLocalUpdateWithError function', () {
    final usecase = GetSideCashUsecase((viewModel) {
      expect(viewModel, isA<GetSideCashViewModel>());
    });

    final GetSideCashViewModel viewModel =
        usecase.buildViewModelForLocalUpdateWithError();
    expect(viewModel.error, 'Must input a request amout for side cash.');
  });
}
