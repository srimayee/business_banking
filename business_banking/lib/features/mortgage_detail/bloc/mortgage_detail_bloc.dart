import 'package:clean_framework/clean_framework.dart';
import '../api/mortgage_detail_service.dart';
import '../model/mortgage_detail_view_model.dart';
import 'mortgage_detail_usecase.dart';

class MortgageDetailBloc extends Bloc {
  MortgageDetailUseCase _useCase;

  final mortgageDetailViewModelPipe = Pipe<MortgageDetailViewModel>();

  @override
  void dispose() {
    mortgageDetailViewModelPipe.dispose();
  }

  MortgageDetailBloc({MortgageDetailService mortgageDetailService}) {
    _useCase = MortgageDetailUseCase(
        (viewModel) => mortgageDetailViewModelPipe.send(viewModel));
    mortgageDetailViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
