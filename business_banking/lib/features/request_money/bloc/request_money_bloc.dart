import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/request_money/model/request_money_view_model.dart';
import 'package:business_banking/features/request_money/api/request_money_service.dart';
import 'request_money_usecase.dart';

class RequestMoneyBloc extends Bloc {
  RequestMoneyUseCase _useCase;

  final quickPayViewModelPipe = Pipe<RequestMoneyViewModel>();

  @override
  void dispose() {
    quickPayViewModelPipe.dispose();
  }

  RequestMoneyBloc({RequestMoneyService quickPayService}) {
    _useCase = RequestMoneyUseCase((viewModel) => quickPayViewModelPipe.send(viewModel));
    quickPayViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}