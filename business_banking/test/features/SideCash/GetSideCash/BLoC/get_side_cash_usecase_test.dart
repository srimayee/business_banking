import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
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
}
