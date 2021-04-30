import 'package:clean_framework/clean_framework.dart';

class CreditCardPaymentResponseViewModel extends ViewModel {
  final String number;
  final String name;
  final String lastFour;
  final double paymentValue;
  final String paymentStatus;
  final String reasonRejected;

  CreditCardPaymentResponseViewModel({
    required this.number,
    required this.name,
    required this.lastFour,
    required this.paymentValue,
    required this.paymentStatus,
    required this.reasonRejected,
  });

  @override
  List<Object?> get props => [
        number,
        name,
        lastFour,
        paymentValue,
        paymentStatus,
        reasonRejected,
      ];

  static CreditCardPaymentResponseViewModel merge(
    CreditCardPaymentResponseViewModel viewModel, {
    double? paymentValue,
    String? paymentStatus,
    String? reasonRejected,
  }) {
    return CreditCardPaymentResponseViewModel(
      number: viewModel.number,
      name: viewModel.name,
      lastFour: viewModel.lastFour,
      paymentValue: paymentValue ?? viewModel.paymentValue,
      paymentStatus: paymentStatus ?? viewModel.paymentStatus,
      reasonRejected: reasonRejected ?? viewModel.reasonRejected,
    );
  }
}

