import 'package:clean_framework/clean_framework.dart';
import 'hello_customer_entity.dart';

class HelloCustomerViewModel extends ViewModel {
  final String helloString;
  HelloCustomerViewModel({HelloCustomerEntity customerEntity})
      : assert(customerEntity != null),
        helloString = customerEntity.accountType == AccountType.private
            ? "${customerEntity.honrsic} ${customerEntity.firstName} ${customerEntity.lastName}"
            : "${customerEntity.nickName}";
}
