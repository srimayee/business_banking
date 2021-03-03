import 'package:clean_framework/clean_framework.dart';
import 'customer_entity.dart';

class CustomerDetailViewModel extends ViewModel {
  final String honorific;
  final String name;
  final String address;
  CustomerDetailViewModel({CustomerEntity customerEntity})
      : assert(customerEntity != null),
        honorific = customerEntity.honorific,
        name = "${customerEntity.firstName} ${customerEntity.lastName}",
        address = customerEntity.address;

    @override
  List<Object> get props => [honorific, name, address];
}
