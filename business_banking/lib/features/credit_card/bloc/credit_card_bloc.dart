import 'package:business_banking/features/credit_card/bloc/payment_request/credit_card_payment_request_usecase.dart';
import 'package:business_banking/features/credit_card/bloc/payment_response/credit_card_payment_response_usecase.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:business_banking/features/credit_card/model/payment_request/credit_card_payment_request_view_model.dart';
import 'package:business_banking/features/credit_card/model/payment_response/credit_card_payment_response_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

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

  Future<pw.Document> generatePDFPaymentConfirmation(
      CreditCardPaymentResponseViewModel viewModel) async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.start,
            crossAxisAlignment: pw.CrossAxisAlignment.center,
            children: [
              /// title
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 40.0),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.center,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text("Payment Confirmation",
                            style: pw.TextStyle(
                                fontSize: 40, fontWeight: pw.FontWeight.bold)),
                      ])),

              /// Credit Card Name
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 40.0),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text("Credit Card: ",
                            style: pw.TextStyle(
                                fontSize: 30, fontWeight: pw.FontWeight.bold)),
                        pw.Text(viewModel.name,
                            style: pw.TextStyle(fontSize: 30)),
                      ])),

              /// Payment Value
              pw.Padding(
                  padding: pw.EdgeInsets.only(top: 40.0),
                  child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.center,
                      children: [
                        pw.Text("Payment Value: ",
                            style: pw.TextStyle(
                                fontSize: 30, fontWeight: pw.FontWeight.bold)),
                        pw.Text(
                            NumberFormat.simpleCurrency()
                                .format(viewModel.paymentValue),
                            style: pw.TextStyle(fontSize: 30)),
                      ])),
            ],
          ); // Center
        })); // Page
    return pdf;
  }
}

/// view events

abstract class CreditCardViewEvents extends Equatable {}

class CreditCardViewEventUpdatePaymentValue extends CreditCardViewEvents {
  final double paymentValue;
  final CreditCardPaymentRequestViewModel viewModel;

  CreditCardViewEventUpdatePaymentValue(this.viewModel, this.paymentValue);

  @override
  List<Object?> get props => [viewModel, paymentValue];
}
