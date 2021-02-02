import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_service.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class GetSideCashBloc extends Bloc {
  GetSideCashUsecase _useCase;
  final viewModelPipe = Pipe<GetSideCashViewModel>();
  final requestValue = EventPipe();
  final resetUsecase = EventPipe();
  final TextEditingController inputController = TextEditingController();

  GetSideCashBloc({GetSideCashService sideCashService}) {
    _useCase = GetSideCashUsecase((viewModel) => viewModelPipe.send(viewModel));
    viewModelPipe.whenListenedDo(() => _useCase.create());
    requestValue.listen(() {
      _useCase.submitGetSideCash(inputController.text);
      inputController.text = null;
    });

    resetUsecase.listen(() {
      _useCase.resetAll();
    });
  }

  validateInput(String v) {
    bool isValid = (v.contains(RegExp(r"^-?[0-9][0-9,\.]+$")));
    if (isValid) {
      _useCase.buildViewModelForValidInput();
      return isValid;
    }
    _useCase.buildViewModelForErrorInput();
    return isValid;
  }

  @override
  void dispose() {
    viewModelPipe.dispose();
    inputController.dispose();
    requestValue.dispose();
  }
}
