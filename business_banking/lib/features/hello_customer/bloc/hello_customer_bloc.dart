import 'package:clean_framework/clean_framework.dart';
import 'package:business_banking/features/hello_customer/model/hello_customer_view_model.dart';

class HelloCustomerBloc extends Bloc {
  final helloCustomerViewModelPipe = Pipe<HelloCustomerViewModel>();

  @override
  void dispose() {
    helloCustomerViewModelPipe.dispose();
  }

  HelloCustomerBloc() {
    helloCustomerViewModelPipe.onListen(() {
      helloCustomerViewModelPipe.send(HelloCustomerViewModel());
    });
  }
}
