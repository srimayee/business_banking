import 'package:business_banking/features/transaction/bloc/transaction_details_usecase.dart';
import 'package:business_banking/features/transaction/model/transaction_details_model.dart';
import 'package:test/test.dart';

void main() {
  test('TransactionUseCase initialize with error', () {
    try {
      TransactionDetailsUseCase(null);
    } catch (e) {
      expect(e != null, true);
    }
  });
  test('TransactionUseCase initialize and create', () {
    final useCase = TransactionDetailsUseCase((viewModel) {
      expect(viewModel, isA<TransactionDetailsModel>());
    });
    useCase.create();
  });

  test('TransactionUseCase initialize and re-create', () {
    final useCase = TransactionDetailsUseCase((viewModel) {
      expect(viewModel, isA<TransactionDetailsModel>());
    });
    useCase.create();
    useCase.create();
  });
}
