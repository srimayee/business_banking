import 'package:clean_framework/clean_framework.dart';

class CreditCardPaymentRequestViewModel extends ViewModel {
  final String number;
  final String name;
  final String lastFour;
  final double balance;
  final DateTime paymentDueDate;
  final DateTime nextClosingDate;
  final double paymentMinimumValue;

  final double paymentValue;

  CreditCardPaymentRequestViewModel({
    required this.number,
    required this.name,
    required this.lastFour,
    required this.balance,
    required this.paymentDueDate,
    required this.nextClosingDate,
    required this.paymentMinimumValue,
    required this.paymentValue,
  });

  @override
  List<Object?> get props => [
        number,
        name,
        lastFour,
        balance,
        paymentDueDate,
        nextClosingDate,
        paymentMinimumValue,
        paymentValue,
      ];

  static CreditCardPaymentRequestViewModel merge(
    CreditCardPaymentRequestViewModel viewModel, {
    double? paymentValue,
  }) {
    return CreditCardPaymentRequestViewModel(
      number: viewModel.number,
      name: viewModel.name,
      lastFour: viewModel.lastFour,
      balance: viewModel.balance,
      paymentDueDate: viewModel.paymentDueDate,
      nextClosingDate: viewModel.nextClosingDate,
      paymentMinimumValue: viewModel.paymentMinimumValue,
      paymentValue: paymentValue ?? viewModel.paymentValue,
    );
  }
}
