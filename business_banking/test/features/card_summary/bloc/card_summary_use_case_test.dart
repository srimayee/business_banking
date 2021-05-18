import 'package:business_banking/features/card_usage/bloc/card_summary_usecase.dart';
import 'package:business_banking/features/card_usage/model/card_summary_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:test/test.dart';

void main() {

  // test('TransactionUseCase initialize with error', () {
  //   try {
  //     CardSummaryUseCase((viewModel_);
  //   } catch (e) {
  //     expect(e != null, true);
  //   }
  // });
  test('TransactionUseCase initialize and create', () {
    final useCase = CardSummaryUseCase((viewModel) {
      expect(viewModel, isA<CardSummaryViewModel>());
    });
    useCase.create();
  });

  test('TransactionUseCase initialize and re-create', () {
    final useCase = CardSummaryUseCase((viewModel) {
      expect(viewModel, isA<CardSummaryViewModel>());
    });
    useCase.create();
    useCase.create();
  });
}
