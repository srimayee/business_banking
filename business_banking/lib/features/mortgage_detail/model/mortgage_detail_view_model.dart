import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class MortgageDetailViewModel extends ViewModel {
  final double escrowBalance;
  final double feesCharged;
  final int loanNumber;

  MortgageDetailViewModel(
      {@required this.escrowBalance,
      @required this.feesCharged,
      @required this.loanNumber})
      : assert(
          escrowBalance != null && feesCharged != null && loanNumber != null,
        );

  @override
  List<Object> get props => [escrowBalance, feesCharged, loanNumber];
}
