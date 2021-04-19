import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/quickpay/model/quickpay_view_model.dart';
import 'package:business_banking/features/quickpay/api/quickpay_service.dart';
import 'quickpay_usecase.dart';

class QuickPayBloc extends Bloc {
  late QuickPayUseCase _useCase;

  final quickPayViewModelPipe = Pipe<QuickPayViewModel>();

  @override
  void dispose() {
    quickPayViewModelPipe.dispose();
  }

  QuickPayBloc({QuickPayService? quickPayService}) {
    _useCase = QuickPayUseCase((viewModel) => quickPayViewModelPipe.send(viewModel as QuickPayViewModel));
    quickPayViewModelPipe.whenListenedDo(() => _useCase.create());
  }
}