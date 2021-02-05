import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/api/get_side_cash_service.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_entity.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'package:flutter/material.dart';

class GetSideCashBloc extends Bloc {
  GetSideCashUsecase useCase;
  final viewModelPipe = Pipe<GetSideCashViewModel>();
  final requestValue = Pipe<String>();
  final resetUsecase = EventPipe();
  final TextEditingController inputController = TextEditingController();

  GetSideCashBloc({GetSideCashService sideCashService}) {
    useCase = GetSideCashUsecase((viewModel) => viewModelPipe.send(viewModel));
    viewModelPipe.whenListenedDo(() => useCase.create());
    requestValue.receive.listen((d) => requestSideCash());
    resetUsecase.listen(() => useCase.resetAll());
  }

  Future<GetSideCashEntity> requestSideCash() async {
    inputController.text = null;
    return await useCase.submitGetSideCash(inputController.text);
  }

  bool validateInput(String v) {
    bool isValid = (v.contains(RegExp(r"^-?[0-9][0-9,\.]+$")));
    if (isValid) {
      useCase.buildViewModelForValidInput();
      return isValid;
    }
    useCase.buildViewModelForErrorInput();
    return isValid;
  }

  @override
  void dispose() {
    viewModelPipe.dispose();
    inputController.dispose();
    requestValue.dispose();
  }
}
