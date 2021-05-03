import 'package:business_banking/features/credit_card/bloc/payment_request/credit_card_payment_request_usecase.dart';
import 'package:business_banking/features/credit_card/bloc/payment_response/credit_card_payment_response_usecase.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'credit_card_usecase.dart';

class CreditCardBloc extends Bloc {
  final creditCardViewEventsPipe =
      Pipe<CreditCardViewEvents>(canSendDuplicateData: true);

  CreditCardUseCase? _creditCardUseCase;
  final creditCardViewModelPipe = Pipe<CreditCardViewModel>();

  CreditCardPaymentRequestUseCase? _creditCardPaymentRequestUseCase;
  final creditCardPaymentRequestViewModelPipe =
      Pipe<CreditCardPaymentRequestViewModel>();

  CreditCardPaymentResponseUseCase? _creditCardPaymentResponseUseCase;
  final creditCardPaymentResponseViewModelPipe =
      Pipe<CreditCardPaymentResponseViewModel>();

  CreditCardBloc({
    CreditCardUseCase? creditCardUseCase,
    CreditCardPaymentRequestUseCase? creditCardPaymentRequestUseCase,
    CreditCardPaymentResponseUseCase? creditCardPaymentResponseUseCase,
  }) {
    creditCardViewEventsPipe.receive.listen((event) {
      creditCardViewEventsPipeHandler(event);
    });

    _creditCardUseCase = creditCardUseCase ??
        CreditCardUseCase((viewModel) =>
            creditCardViewModelPipe.send(viewModel as CreditCardViewModel));
    creditCardViewModelPipe.whenListenedDo(_creditCardUseCase!.create);

    _creditCardPaymentRequestUseCase = creditCardPaymentRequestUseCase ??
        CreditCardPaymentRequestUseCase((viewModel) =>
            creditCardPaymentRequestViewModelPipe
                .send(viewModel as CreditCardPaymentRequestViewModel));
    creditCardPaymentRequestViewModelPipe
        .whenListenedDo(_creditCardPaymentRequestUseCase!.create);

    _creditCardPaymentResponseUseCase = creditCardPaymentResponseUseCase ??
        CreditCardPaymentResponseUseCase((viewModel) =>
            creditCardPaymentResponseViewModelPipe
                .send(viewModel as CreditCardPaymentResponseViewModel));
    creditCardPaymentResponseViewModelPipe
        .whenListenedDo(_creditCardPaymentResponseUseCase!.create);
  }

  @override
  void dispose() {
    creditCardViewEventsPipe.dispose();
    creditCardViewModelPipe.dispose();
    creditCardPaymentRequestViewModelPipe.dispose();
    creditCardPaymentResponseViewModelPipe.dispose();
  }

  creditCardViewEventsPipeHandler(CreditCardViewEvents event) {
    if (event is CreditCardViewEventUpdatePaymentValue) {
      _creditCardPaymentRequestUseCase!.updatePaymentValue(event.paymentValue);
      return;
    }
  }

  String validatePaymentInformation(
      CreditCardPaymentRequestViewModel creditCardPaymentRequestViewModel,
      double paymentValue) {
    return _creditCardPaymentRequestUseCase!
        .validatePaymentInformation(paymentValue);
  }
}

/// view events

abstract class CreditCardViewEvents extends Equatable {}

/*
class CreditCardViewEventNavigateToDetailsScreen extends CreditCardViewEvents {

  final CreditCardViewModel viewModel;
  final BuildContext context;

  CreditCardViewEventNavigateToDetailsScreen(this.viewModel, this.context);

  @override
  List<Object?> get props => [viewModel];

}

 */
/*
class CreditCardViewEventNavigateBackToHubScreen extends CreditCardViewEvents {

  final BuildContext context;

  CreditCardViewEventNavigateBackToHubScreen(this.context);

  @override
  List<Object?> get props => [];

}
 */

/*
class CreditCardViewEventNavigateToPaymentRequestScreen extends CreditCardViewEvents {

  final CreditCardViewModel viewModel;
  final BuildContext context;

  CreditCardViewEventNavigateToPaymentRequestScreen(this.viewModel, this.context);

  @override
  List<Object?> get props => [viewModel];

}
 */

/*
class CreditCardViewEventNavigateBackToDetailsScreen extends CreditCardViewEvents {

  final BuildContext context;

  CreditCardViewEventNavigateBackToDetailsScreen(this.context);

  @override
  List<Object?> get props => [];

}

 */
class CreditCardViewEventUpdatePaymentValue extends CreditCardViewEvents {
  final double paymentValue;
  final CreditCardPaymentRequestViewModel viewModel;
  final BuildContext context;

  CreditCardViewEventUpdatePaymentValue(
      this.viewModel, this.context, this.paymentValue);

  @override
  List<Object?> get props => [viewModel, paymentValue];
}

/*
class CreditCardViewEventConfirmPayment extends CreditCardViewEvents {

  final CreditCardPaymentRequestViewModel viewModel;
  final BuildContext context;

  CreditCardViewEventConfirmPayment(this.viewModel, this.context);

  @override
  List<Object?> get props => [viewModel];

}
*/
