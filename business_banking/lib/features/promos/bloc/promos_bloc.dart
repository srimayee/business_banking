import 'package:business_banking/features/promos/api/promos_service.dart';
import 'package:business_banking/features/promos/bloc/promos_usecase.dart';
import 'package:business_banking/features/promos/models/promos_view_model.dart';
import 'package:clean_framework/clean_framework.dart';

class PromosBloc extends Bloc {
  PromosUseCase _useCase;

  final promosViewModelPipe = Pipe<PromosViewModel>();

  PromosBloc({PromosService promosService}) {
    _useCase = PromosUseCase((viewModel) => promosViewModelPipe.send(viewModel));
    promosViewModelPipe.onListen(() => _useCase.create());
  }

  @override
  void dispose() {}
}
