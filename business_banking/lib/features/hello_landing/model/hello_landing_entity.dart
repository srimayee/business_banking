import 'package:clean_framework/clean_framework.dart';

class HelloLandingEntity extends Entity {
  HelloLandingEntity(
    {List<EntityError> errors = const []}
  ) : super(errors: errors);
  
  @override
  List<Object> get props => [errors];
  
  @override
  merge({errors}) {
    return HelloLandingEntity(errors: errors ?? this.errors);
  }
}