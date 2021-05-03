// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/payment_request/credit_card_payment_request_usecase.dart';
import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  test('CreditCardPaymentRequestUseCase create', () async {
    var _viewModel;
    final useCase = CreditCardPaymentRequestUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<CreditCardPaymentRequestViewModel>());
  });

  test('CreditCardPaymentRequestUseCase updatePaymentValue', () async {
    var _viewModel;
    final useCase = CreditCardPaymentRequestUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    await useCase.updatePaymentValue(20);
    expect(_viewModel, isA<CreditCardPaymentRequestViewModel>());
    expect((_viewModel as CreditCardPaymentRequestViewModel).paymentValue, 20);
  });

  test('CreditCardPaymentRequestUseCase validatePaymentInformation', () async {
    final useCase = CreditCardPaymentRequestUseCase((viewModel) {
      return true;
    });
    double paymentValue = 20.0;
    expect(useCase.validatePaymentInformation(paymentValue), paymentValue > 0 ? '' : "Please inform the payment amount!");
    paymentValue = 0.0;
    expect(useCase.validatePaymentInformation(paymentValue), paymentValue > 0 ? '' : "Please inform the payment amount!");
    paymentValue = -20.0;
    expect(useCase.validatePaymentInformation(paymentValue), paymentValue > 0 ? '' : "Please inform the payment amount!");
  });




}
