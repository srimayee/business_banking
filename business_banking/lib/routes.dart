import 'package:business_banking/features/account_detail/ui/account_detail_widget.dart';
import 'package:business_banking/features/budget/ui/chart/view_chart_widget.dart';
import 'package:business_banking/features/credit_card/ui/credit_card_details/credit_card_details_widget.dart';
import 'package:business_banking/features/customer/ui/customer_detail_widget.dart';
import 'package:business_banking/features/hotels/ui/hotels_main/hotels_main_widget.dart';
import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/login/ui/login_feature_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/confirmation/transfer_confirmation_widget.dart';
import 'package:business_banking/features/transfer_funds/ui/transfer_widget.dart';
import 'package:flutter/material.dart';

import 'features/credit_card/ui/payment_request/credit_card_payment_request_widget.dart';
import 'features/credit_card/ui/payment_response/credit_card_payment_response_widget.dart';
import 'features/deposit_check/ui/2nd_data_entry/deposit_check_widget.dart';
import 'features/deposit_check/ui/3rd_request_confirmation/deposit_check_confirm_widget.dart';
import 'features/investment_detail/ui/investment_detail_feature_widget.dart';

abstract class BusinessBankingRouter {
  static const String initialRoute = '/';
  static const String hubRoute = '/hub';
  static const String transferFundsRoute = '/transferFunds';
  static const String transferFundsConfirmRoute = '/transferFundsConfirm';
  static const String accountDetailRoute = '/accountDetail';
  static const String customerDetailRoute = '/customerDetail';
  static const String viewBudgetChartRoute = '/viewBudgetChartRoute';
  static const String investmentDetailRoute = '/investmentDetail';
  static const String creditCardDetailsRoute = '/creditCardDetails';
  static const String creditCardPaymentRequestRoute =
      '/creditCardPaymentRequest';
  static const String creditCardPaymentResponseRoute =
      '/creditCardPaymentResponse';
  static const String depositCheckRoute = '/depositCheck';
  static const String depositCheckConfirmRoute = '/depositCheckConfirm';
  static const String hotelsRoute = '/hotels';

  static Widget generate(String name) {
    switch (name) {
      case initialRoute:
        return LoginFeatureWidget();

      case hubRoute:
        return HubScreen();

      case transferFundsRoute:
        return TransferFundsWidget();

      case transferFundsConfirmRoute:
        return TransferFundsConfirmationWidget();

      case accountDetailRoute:
        return AccountDetailWidget();

      case customerDetailRoute:
        return CustomerDetailWidget();

      case viewBudgetChartRoute:
        return ViewChartWidget();

      case investmentDetailRoute:
        return InvestmentDetailWidget();

      case creditCardDetailsRoute:
        return CreditCardDetailsWidget();

      case creditCardPaymentRequestRoute:
        return CreditCardPaymentRequestWidget();

      case creditCardPaymentResponseRoute:
        return CreditCardPaymentResponseWidget();

      case depositCheckRoute:
        return DepositCheckWidget();

      case depositCheckConfirmRoute:
        return DepositCheckConfirmWidget();

      case hotelsRoute:
        return HotelsWidget();

      default:
        return const PageNotFound();
    }
  }
}

class PageNotFound extends StatelessWidget {
  const PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('404, Page Not Found!')));
  }
}
