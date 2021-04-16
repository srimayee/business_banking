// package
import 'package:clean_framework/clean_framework.dart';
// iinternal
import '../api/investment_service.dart';
import '../model/investment_view_model.dart';
import 'investment_usecase.dart';

class InvestmentBloc extends Bloc {
  late final InvestmentUseCase _useCase;

  final investmentViewModelPipe = Pipe<InvestmentViewModel>();

  @override
  void dispose() {
    investmentViewModelPipe.dispose();
  }

  InvestmentBloc() {
    _useCase = InvestmentUseCase(investmentViewModelPipe.send);
    investmentViewModelPipe.whenListenedDo(() => _useCase.execute());
  }
}
