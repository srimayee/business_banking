import 'package:clean_framework/clean_framework.dart';
import 'hello_customer_entity.dart';

class HelloCustomerDetailEntity extends Entity {
  final HelloCustomerEntity customerEntity;
  final String weather;
  final String address;

  HelloCustomerDetailEntity(
      {List<EntityError> errors = const [],
      HelloCustomerEntity customerEntity,
      String weather,
      String address})
      : this.customerEntity = customerEntity ?? HelloCustomerEntity(),
        this.weather = weather ?? "",
        this.address = address ?? "",
        super(errors: errors);

  @override
  List<Object> get props => [errors, customerEntity, weather, address];

  @override
  merge({errors, String name, String lastLoginTime}) {
    return HelloCustomerDetailEntity(
        errors: errors ?? this.errors,
        customerEntity: customerEntity ?? this.customerEntity,
        weather: weather ?? this.weather,
        address: address ?? this.address);
  }

  @override
  String toString() {
    return "$customerEntity $weather $address";
  }
}
