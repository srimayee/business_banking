import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// ignore: must_be_immutable
class MockGetSideCashViewModel extends Mock implements GetSideCashViewModel {}

void main() {
  test('GetSideCashViewModel init', () {
    final viewModel = GetSideCashViewModel(
        amountRequested: '12.34', requestSuccess: null, error: null);

    expect(viewModel.amountRequested, '12.34');
    expect(viewModel.requestSuccess, null);
    expect(viewModel.error, null);
  });

  test('GetSideCashViewModel initialize with error values', () {
    try {
      final viewModel = GetSideCashViewModel(
          amountRequested: null,
          requestSuccess: null,
          error: 'Something went wrong');
      expect(viewModel.amountRequested, null);
    } catch (error) {
      expect(error != null, true);
    }
  });
}
