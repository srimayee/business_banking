import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:business_banking/features/hello_landing/api/hello_landing_service.dart';
import 'hello_landing_usecase.dart';

class HelloLandingBloc extends Bloc {
  HelloLandingUseCase _useCase;

  final helloLandingViewModelPipe = Pipe<HelloLandingViewModel>();

  @override
  void dispose() {
    helloLandingViewModelPipe.dispose();
  }

  HelloLandingBloc({HelloLandingService helloLandingService}) {
    _useCase = HelloLandingUseCase((viewModel) => helloLandingViewModelPipe.send(viewModel));
    helloLandingViewModelPipe.onListen(() => _useCase.execute());
  }
}