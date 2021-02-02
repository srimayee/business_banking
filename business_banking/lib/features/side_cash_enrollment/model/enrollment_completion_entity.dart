

import 'package:clean_framework/clean_framework.dart';

class EnrollmentCompletionEntity extends Entity {
  final String message;
  final bool isSuccess;

  @override
  List<Object> get props => [message, isSuccess];

  EnrollmentCompletionEntity({
    this.message,
    this.isSuccess,
    List<EntityFailure> errors = const [],
  }) : super(errors: errors);


}
