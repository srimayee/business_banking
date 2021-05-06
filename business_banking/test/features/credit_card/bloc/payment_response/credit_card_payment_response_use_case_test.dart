// @dart=2.9
import 'package:business_banking/features/credit_card/bloc/payment_response/credit_card_payment_response_usecase.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_entity.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('CreditCardPaymentResponseUseCase create', () async {
    var _viewModel;
    final useCase = CreditCardPaymentResponseUseCase((viewModel) {
      _viewModel = viewModel;
      return true;
    });
    await useCase.create();
    expect(_viewModel, isA<CreditCardPaymentResponseViewModel>());
  });

  test('CreditCardPaymentResponseUseCase buildViewModel', () async {
    final useCase = CreditCardPaymentResponseUseCase((viewModel) {
      return true;
    });

    var entity = CreditCardPaymentResponseEntity(
        errors: [],
        paymentStatus: "Successful",
        reasonRejected: "123"
    );

    CreditCardPaymentResponseViewModel viewModel = useCase.buildViewModel(entity);
    expect(viewModel.paymentStatus, entity.paymentStatus);
    expect(viewModel.reasonRejected, entity.reasonRejected);


    entity = CreditCardPaymentResponseEntity(
        errors: [EntityFailure()],
        paymentStatus: "Successful",
        reasonRejected: "123"
    );

    viewModel = useCase.buildViewModel(entity);
    expect(viewModel.paymentStatus, 'Error');
    expect(viewModel.reasonRejected, 'Error: ' + entity.errors[0].toString());


  });


  /*
  test('CreditCardPaymentResponseUseCase updatePaymentValue', () async {
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


  */



}
