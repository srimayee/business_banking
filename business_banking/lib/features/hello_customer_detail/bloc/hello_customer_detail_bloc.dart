import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer_detail/model/hello_customer_detail_view_model.dart';
import 'package:business_banking/features/hello_customer_detail/api/hello_customer_detail_service.dart';
import 'hello_customer_detail_usecase.dart';

class HelloCustomerDetailBloc extends Bloc {
  HelloCustomerDetailUseCase _useCase;

  final helloCustomerDetailViewModelPipe = Pipe<HelloCustomerDetailViewModel>();

  @override
  void dispose() {
    helloCustomerDetailViewModelPipe.dispose();
  }

  HelloCustomerDetailBloc(
      {HelloCustomerDetailService helloCustomerDetailService}) {
    _useCase = HelloCustomerDetailUseCase((viewModel) {
      return helloCustomerDetailViewModelPipe.send(viewModel);
    });
    helloCustomerDetailViewModelPipe.onListen(() => _useCase.create());
  }
}
