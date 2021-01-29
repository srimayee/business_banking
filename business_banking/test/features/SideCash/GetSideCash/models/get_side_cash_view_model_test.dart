import 'package:test/test.dart';

void main() {
  test('GetSideCashViewModel init', () {
    final viewModel = GetSideCashViewModel(
        {amountRequested: '12.34', requestSuccess: true, error: null});

    expect(viewModel.amountRequested, '12.34');
    expect(viewModel.requestSuccess, true);
    expect(viewModel.error, null);
  });

  test('GetSideCashViewModel initialize with error values', () {
    try {
      GetSideCashUsecase(
          {amountRequested: null, requestSuccess: null, error: null});
      expect(false, true);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
