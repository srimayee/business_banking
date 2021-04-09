import 'package:business_banking/features/transaction/bloc/transaction_usecase.dart';
import 'package:business_banking/features/transaction/model/transaction_model.dart';
import 'package:test/test.dart';

void main() {
  test('TransactionUseCase initialize with error', () {
    try {
      TransactionUseCase(null);
    } catch (e) {
      expect(e != null, true);
    }
  });
  test('TransactionUseCase initialize and create', () {
    final useCase = TransactionUseCase((viewModel) {
      expect(viewModel, isA<TransactionModel>());
    });
    useCase.create();
  });

  test('TransactionUseCase initialize and re-create', () {
    final useCase = TransactionUseCase((viewModel) {
      expect(viewModel, isA<TransactionModel>());
    });
    useCase.create();
    useCase.create();
  });
}
