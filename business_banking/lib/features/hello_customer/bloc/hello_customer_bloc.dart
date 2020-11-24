import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_service.dart';
import 'package:business_banking/features/hello_customer/api/hello_customer_detail_service.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_detail_view_model.dart';
import 'hello_customer_usecase.dart';
import 'hello_customer_detail_usecase.dart';

class HelloCustomerBloc extends Bloc {
  HelloCustomerUseCase _useCase;
  HelloCustomerDetailUseCase _detailUseCase;

  final helloCustomerViewModelPipe = Pipe<HelloCustomerViewModel>();
  final helloCustomerDetailViewModelPipe = Pipe<HelloCustomerDetailViewModel>();

  @override
  void dispose() {
    helloCustomerViewModelPipe.dispose();
    helloCustomerDetailViewModelPipe.dispose();
  }

  HelloCustomerBloc(
      {HelloCustomerService helloCustomerService,
      HelloCustomerDetailService helloCustomerDetailService}) {
    _useCase = HelloCustomerUseCase((viewModel) {
      return helloCustomerViewModelPipe.send(viewModel);
    });

    helloCustomerViewModelPipe.onListen(() => _useCase.create());

    _detailUseCase = HelloCustomerDetailUseCase((viewModel) {
      return helloCustomerDetailViewModelPipe.send(viewModel);
    });

    helloCustomerDetailViewModelPipe.onListen(() => _detailUseCase.create());
  }
}
