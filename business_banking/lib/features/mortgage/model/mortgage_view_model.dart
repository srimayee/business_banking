import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class MortgageViewModel extends ViewModel {
  final DateTime monthlyPaymentDue;
  final double monthlyAmountDue;
  final double outstandingPrincipal;
  final double interestRate;

  MortgageViewModel(
      {@required this.monthlyAmountDue,
      @required this.monthlyPaymentDue,
      @required this.outstandingPrincipal,
      @required this.interestRate})
      : assert(interestRate != null &&
            monthlyAmountDue != null &&
            outstandingPrincipal != null &&
            monthlyPaymentDue != null);
  @override
  List<Object> get props =>
      [monthlyPaymentDue, monthlyAmountDue, outstandingPrincipal, interestRate];
}
