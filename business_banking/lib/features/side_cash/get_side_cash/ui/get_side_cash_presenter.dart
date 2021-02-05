import 'package:business_banking/features/hub/ui/hub_screen.dart';
import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:business_banking/features/side_cash/get_side_cash/ui/get_side_cash_screen.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class GetSideCashPresenter extends Presenter<GetSideCashBloc,
    GetSideCashViewModel, GetSideCashScreen> {
  @override
  buildScreen(BuildContext context, GetSideCashBloc bloc,
      GetSideCashViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      if (viewModel.requestSuccess == true) {
        return presentSuccess(context, bloc);
      }
      return GetSideCashScreen(
        requestSideCash: (String amt) {
          requestSideCash(amt, bloc);
        },
        onControllerChanged: (String amount) {
          onControllerChanged(amount, bloc);
        },
        viewModel: viewModel,
        inputController: bloc.inputController,
      );
    });
    return GetSideCashScreen(
      requestSideCash: (String amt) {
        requestSideCash(amt, bloc);
      },
      onControllerChanged: (String amount) {
        onControllerChanged(amount, bloc);
      },
      viewModel: viewModel,
      inputController: bloc.inputController,
    );
  }

  @override
  Stream<GetSideCashViewModel> getViewModelStream(GetSideCashBloc bloc) {
    return bloc.viewModelPipe.receive;
  }

  Future<dynamic> presentSuccess(BuildContext context, GetSideCashBloc bloc) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => AlertDialog(
        key: Key('SideCashDetailsSuccessMessage'),
        title: const Text('Side Cash Request Successful'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text("Awesome!"),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              resetViewModel(bloc);
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (_) => HubScreen()));
            },
            textColor: Theme.of(context).primaryColor,
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  bool resetViewModel(GetSideCashBloc bloc) {
    return bloc.resetUsecase.launch();
  }

  bool requestSideCash(String amt, GetSideCashBloc bloc) {
    bool isValid = bloc.validateInput(amt);
    if (isValid) {
      return bloc.requestValue.send(amt);
    }
    return false;
  }

  bool onControllerChanged(String amount, GetSideCashBloc bloc) {
    return bloc.validateInput(amount);
  }
}
