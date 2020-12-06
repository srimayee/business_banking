import 'package:clean_framework/clean_framework.dart';
import 'mortgage_usecase.dart';
import '../model/mortgage_view_model.dart';
import '../api/mortgage_service.dart';

class MortgageBloc extends Bloc {
  MortgageUseCase _useCase;

  final mortgageViewModelPipe = Pipe<MortgageViewModel>();

  @override
  void dispose() {
    mortgageViewModelPipe.dispose();
  }

  MortgageBloc({MortgageService mortgageService}) {
    _useCase =
        MortgageUseCase((viewModel) => mortgageViewModelPipe.send(viewModel));
    mortgageViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}
