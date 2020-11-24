import 'package:clean_framework/clean_framework.dart';
import 'customer_entity.dart';

class CustomerViewModel extends ViewModel {
  final String helloString;
  CustomerViewModel({CustomerEntity customerEntity})
      : assert(customerEntity != null),
        helloString = customerEntity.accountType == AccountType.private
            ? "${customerEntity.honorific} ${customerEntity.firstName} ${customerEntity.lastName}"
            : "${customerEntity.nickName}";
}
