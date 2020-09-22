import 'package:business_banking/features/billpay/api/billpay_service.dart';
import 'package:business_banking/features/billpay/model/billpay_view_model.dart';
import 'package:clean_framework/clean_framework.dart';
import 'billpay_usecase.dart';

class BillPayBloc extends Bloc {
  //
  BillPayUseCase _useCase;
  final submitPipe = EventPipe();
  final billPayViewModelPipe = Pipe<BillPayViewModel>();

  @override
  void dispose() {
    billPayViewModelPipe.dispose();
    submitPipe.dispose();
  }

  BillPayBloc({BillPayService billPayService}) {
    _useCase =
        BillPayUseCase((viewModel) => billPayViewModelPipe.send(viewModel));
    billPayViewModelPipe.onListen(() => _useCase.create());
    submitPipe.listen(submitHandler);
  }

  void submitHandler() {
    _useCase.startBillPay();
  }
}
