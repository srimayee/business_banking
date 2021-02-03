import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/src/widgets/framework.dart';

class GetSideCashPresenter extends Presenter<GetSideCashBloc,
    GetSideCashViewModel, GetSideCashScreen> {
  @override
  buildScreen(BuildContext context, GetSideCashBloc bloc,
      GetSideCashViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.requestSuccess == true) {
        _presentSuccess(context, bloc);
      }
      return GetSideCashScreen(
        requestSideCash: (String amt) {
          _requestSideCash(amt, bloc);
        },
        onControllerChanged: (String amount) {
          _onControllerChanged(amount, bloc);
        },
        viewModel: viewModel,
        inputController: bloc.inputController,
      );
    });
    return GetSideCashScreen(
      requestSideCash: (String amt) {
        _requestSideCash(amt, bloc);
      },
      onControllerChanged: (String amount) {
        _onControllerChanged(amount, bloc);
      },
      viewModel: viewModel,
      inputController: bloc.inputController,
    );
  }

  @override
  Stream<GetSideCashViewModel> getViewModelStream(GetSideCashBloc bloc) {
    return bloc.viewModelPipe.receive;
  }

  _presentSuccess(BuildContext context, GetSideCashBloc bloc) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Side Cash Request Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Awesome!"),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              _resetViewModel(bloc);
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  _resetViewModel(GetSideCashBloc bloc) {
    bloc.resetUsecase.launch();
  }

  _requestSideCash(String amt, GetSideCashBloc bloc) {
    bool isValid = bloc.validateInput(amt);
    if (isValid) {
      bloc.requestValue.launch();
    }
  }

  _onControllerChanged(String amount, GetSideCashBloc bloc) {
    bloc.validateInput(amount);
  }
}
