import 'package:clean_framework/clean_framework.dart';

class HelloCustomerDetailEntity extends Entity {
  final String name;
  final String currentTimeString;

  HelloCustomerDetailEntity(
      {List<EntityError> errors = const [],
      String name,
      String currentTimeString})
      : name = name ?? 'Name',
        currentTimeString = currentTimeString ?? '00/00/00 00:00',
        super(errors: errors);

  @override
  List<Object> get props => [errors, name, currentTimeString];

  @override
  merge({errors, String name, String currentTimeString}) {
    return HelloCustomerDetailEntity(
        errors: errors ?? this.errors,
        name: name ?? this.name,
        currentTimeString: currentTimeString ?? this.currentTimeString);
  }

  @override
  String toString() {
    return "$name $currentTimeString";
  }
}
