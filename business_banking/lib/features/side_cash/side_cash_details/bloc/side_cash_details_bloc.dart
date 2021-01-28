import 'package:business_banking/features/side_cash/side_cash_details/api/side_cash_details_service.dart';
import 'package:business_banking/features/side_cash/side_cash_details/bloc/side_cash_details_usecase.dart';
import 'package:business_banking/features/side_cash/side_cash_details/models/side_cash_details_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class SideCashDetailsBloc extends Bloc {
  SideCashDetailsUsecase _useCase;

  final viewModelPipe = Pipe<SideCashDetailsViewModel>();

  SideCashDetailsBloc({SideCashDetailsService billPayService}) {
    _useCase =
        SideCashDetailsUsecase((viewModel) => viewModelPipe.send(viewModel));
    viewModelPipe.whenListenedDo(() => _useCase.create());
  }

  @override
  void dispose() {
    viewModelPipe.dispose();
  }
}
