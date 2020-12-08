import 'dart:async';
import 'package:business_banking/features/bill_pay/bloc/bill_pay_info_bloc.dart';
import 'package:business_banking/features/bill_pay/model/view_models/bill_pay_info_view_model.dart';
import 'package:business_banking/features/bill_pay/ui/bill_pay_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/scheduler.dart';

// import 'customer_screen.dart';
// import 'customer_detail_widget.dart';

class BillPayInfoPresenter extends Presenter<BillPayInfoBloc,
    BillPayInfoViewModel, BillPayInfoScreen> {
  @override
  Stream<BillPayInfoViewModel> getViewModelStream(BillPayInfoBloc bloc) {
    return bloc.billPayInfoViewModelPipe.receive;
  }

  @override
  BillPayInfoScreen buildScreen(BuildContext context, BillPayInfoBloc bloc,
      BillPayInfoViewModel viewModel) {

    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (viewModel.serviceStatus == ServiceStatus.success) {
        return;
      } else if (viewModel.serviceStatus == ServiceStatus.fail) {
        print(viewModel.toString());
        _showErrorDialog(context);
      }
      // } else if (viewModel.serviceStatus == ServiceStatus.unknown) {
      //   _showInvalidDataDialog(context);
      // }
    });

    return BillPayInfoScreen(
      viewModel,
      // navigateToCustomerDetail: () {
      //   _navigateToCustomerDetail(context);
      // },
    );
  }

  void _showErrorDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Error'),
        content: Text('Failed fetch for bill pay info'),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget buildLoadingScreen(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  // TODO trigger this on errors
  @override
  Widget buildErrorScreen(BuildContext context, Error error) {
    return Center(
      child: Text('error: $error'),
    );
  }


}
