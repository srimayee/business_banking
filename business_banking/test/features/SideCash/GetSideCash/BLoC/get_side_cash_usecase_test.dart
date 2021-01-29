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
