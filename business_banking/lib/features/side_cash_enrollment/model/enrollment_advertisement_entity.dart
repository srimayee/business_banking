import 'package:clean_framework/clean_framework.dart';

class EnrollmentAdvertisementEntity extends Entity {
  final String message;

  @override
  List<Object> get props => [message];

  EnrollmentAdvertisementEntity({
    this.message,
    List<EntityFailure> errors = const [],
  }) : super(errors: errors);



  //4
  @override
  merge({errors, String message}) {
    final EnrollmentAdvertisementEntity mergedEntity = EnrollmentAdvertisementEntity(
      errors: errors ?? this.errors,
      message: message ?? this.message,
    );
    return mergedEntity;
  }
}
