import 'package:clean_framework/clean_framework.dart';
import 'hello_customer_detail_entity.dart';

class HelloCustomerDetailViewModel extends ViewModel {
  final String honrsic;
  final String name;
  final String weather;
  final String address;
  HelloCustomerDetailViewModel({HelloCustomerDetailEntity customerDetailEntity})
      : assert(customerDetailEntity != null),
        honrsic = customerDetailEntity.customerEntity.honrsic,
        name = "${customerDetailEntity.customerEntity.firstName} ${customerDetailEntity.customerEntity.lastName}",
        weather = customerDetailEntity.weather,
        address = customerDetailEntity.address;
}
