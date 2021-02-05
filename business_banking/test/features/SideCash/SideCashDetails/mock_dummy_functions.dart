import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_bloc.dart';
import 'package:business_banking/features/side_cash/get_side_cash/BLoC/get_side_cash_usecase.dart';
import 'package:business_banking/features/side_cash/get_side_cash/model/get_side_cash_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:mockito/mockito.dart';
import 'package:clean_framework/clean_framework.dart';

class DummyFunctions {
  dynamic voidCallBack(dynamic v) {}
  dynamic navigate(BuildContext ctx) {}
  dynamic emptyCallback() {}
}

class MockDummyFunctions extends Mock implements DummyFunctions {}

class MockGetSideCashBloc extends Mock implements GetSideCashBloc {
  final GetSideCashUsecase useCase = GetSideCashUsecase((_) {});
  final viewModelPipe = Pipe<GetSideCashViewModel>();
  final requestValue = Pipe<String>();
  final resetUsecase = EventPipe();
  final TextEditingController inputController = TextEditingController();

  MockGetSideCashBloc() {
    useCase = GetSideCashUsecase((viewModel) => viewModelPipe.send(viewModel));
    useCase.create();
    viewModelPipe.whenListenedDo(() => useCase.create());
    requestValue.receive.listen((d) => requestSideCash());
    resetUsecase.listen(() => useCase.resetAll());
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
}
