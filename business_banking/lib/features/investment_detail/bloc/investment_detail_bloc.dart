// package
import 'package:clean_framework/clean_framework.dart';
// internal
import '../api/investment_detail_service.dart';
import 'investment_detail_usecase.dart';
import '../model/investment_detail_view_model.dart';

class InvestmentDetailBloc extends Bloc {
  late final InvestmentDetailUseCase _useCase;

  final investmentDetailViewModelPipe = Pipe<InvestmentDetailViewModel>();

  @override
  void dispose() {
    investmentDetailViewModelPipe.dispose();
  }

  InvestmentDetailBloc() {
    _useCase = InvestmentDetailUseCase(investmentDetailViewModelPipe.send);
    investmentDetailViewModelPipe.whenListenedDo(() => _useCase.execute());
  }
}
