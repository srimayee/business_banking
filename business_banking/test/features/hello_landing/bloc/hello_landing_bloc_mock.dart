import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_landing/bloc/hello_landing_bloc.dart';
import 'package:business_banking/features/hello_landing/model/hello_landing_view_model.dart';
import 'package:mockito/mockito.dart';

class HelloLandingBlocMock extends Fake implements HelloLandingBloc {
  @override
  Pipe<HelloLandingViewModel> helloLandingViewModelPipe = Pipe<HelloLandingViewModel>();

  HelloLandingBlocMock() {
    helloLandingViewModelPipe.onListen(() {
      helloLandingViewModelPipe.send(HelloLandingViewModel());
    });
  }
  
  @override
  void dispose() {}
}