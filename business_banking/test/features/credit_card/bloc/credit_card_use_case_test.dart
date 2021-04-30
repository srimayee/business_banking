// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/bloc/credit_card_usecase.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';


void main() {
  test('CreditCardUseCase create', () async {
    var _viewModel;
    final useCase = CreditCardUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<CreditCardViewModel>());
  });



}
