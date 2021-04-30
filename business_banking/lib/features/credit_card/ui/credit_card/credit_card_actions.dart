import 'package:business_banking/features/credit_card/bloc/credit_card_bloc.dart';
import 'package:business_banking/features/credit_card/model/credit_card_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

import '../../../../routes.dart';

class CreditCardActions {

  final CreditCardBloc bloc;

  CreditCardActions(this.bloc);

  void navigateToCreditCardDetails(BuildContext context, CreditCardViewModel viewModel) {
    CFRouterScope.of(context).push(BusinessBankingRouter.creditCardDetailsRoute);
  }

}
