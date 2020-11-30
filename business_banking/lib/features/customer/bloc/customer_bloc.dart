import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/customer/api/customer_service.dart';
import 'package:business_banking/features/customer/model/customer_view_model.dart';
import 'package:business_banking/features/customer/model/customer_detail_view_model.dart';
import 'customer_usecase.dart';
import 'customer_detail_usecase.dart';

class CustomerBloc extends Bloc {
  CustomerUseCase _useCase;
  CustomerDetailUseCase _detailUseCase;

  final customerViewModelPipe = Pipe<CustomerViewModel>();
  final customerDetailViewModelPipe = Pipe<CustomerDetailViewModel>();

  @override
  void dispose() {
    customerViewModelPipe.dispose();
    customerDetailViewModelPipe.dispose();
  }

  CustomerBloc(
      {CustomerService customerService}) {
    _useCase = CustomerUseCase((viewModel) {
      return customerViewModelPipe.send(viewModel);
    });

    customerViewModelPipe.whenListenedDo(() => _useCase.create());

    _detailUseCase = CustomerDetailUseCase((viewModel) {
      return customerDetailViewModelPipe.send(viewModel);
    });

    customerDetailViewModelPipe.whenListenedDo(() => _detailUseCase.create());
  }
}
